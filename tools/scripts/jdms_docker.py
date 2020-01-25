import os
import pathlib
import subprocess
import time

def get_ip():
    # SO Question: https://stackoverflow.com/questions/166506/finding-local-ip-addresses-using-pythons-stdlib
    #              UnkwnTech: https://stackoverflow.com/users/115/unkwntech
    # Answer: https://stackoverflow.com/a/28950776
    #         Jamieson Becker: https://stackoverflow.com/users/1301627/jamieson-becker
    import socket
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

def run_process(cmd):

    print('Running: {}'.format(' '.join(cmd)))

    with subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT) as proc:
        for line in proc.stdout:
            print('>> ' + line.decode('utf8'))


        if proc.wait() != 0:
            raise Exception('Command failed: {}'.format(' '.join(cmd)))

def run_with_x(cmd):
    if os.name == 'nt':
        with subprocess.Popen(['XWin.exe',
                               ':0',
                               '-listen',
                               'tcp',
                               '-multiwindow']) as xwin:

            run_process(cmd)

            xwin.kill()

    else:
        run_process(cmd)

def build_images():

    print('Building docker images')
    start_dir = os.getcwd()

    base_dir = os.path.join(start_dir, 'tools', 'docker', 'base')
    dev_dir  = os.path.join(start_dir, 'tools', 'docker', 'dev')

    if not os.path.isdir(base_dir) or not os.path.isdir(dev_dir):
        print('Unable to locate docker dirs')
        return 1

    os.chdir(base_dir)

    run_process(['docker','image','build', '--tag', 'local:jdms-base', '.'])

    os.chdir(dev_dir)

    run_process(['docker','image','build', '--tag', 'local:jdms-dev', '.'])

    os.chdir(start_dir)
    return 0

def remove_images():
    run_process(['docker', 'rmi', 'local:jdms-dev', 'local:jdms-base'])

def map_folder(local, container):
    return ['-v', '{}:{}'.format(local, container)]

def map_port(local, container):
    return ['-p', '{}:{}'.format(local, container)]

def set_env_var(key, value):
    return ['-e', '{}={}'.format(key, value)]

def start_container(command):
    current_script_path = os.path.realpath(__file__)
    root_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(current_script_path))))

    emacs_d_dir = os.path.join(root_dir, 'jdms', 'tools', 'resources', 'emacs.d')
    ssh_dir = os.path.join(str(pathlib.Path.home()), '.ssh')

    args  = ['docker', 'container', 'run']
    args += map_folder(root_dir, '/project')
    args += map_folder(emacs_d_dir, '/root/.emacs.d')
    args += map_folder(ssh_dir, '/tmp/.ssh')

    args += map_port('8080', '8080')

    args += set_env_var('TERM', 'bash')

    if os.name == 'nt':
        args += set_env_var('DISPLAY', get_ip())
    else:
        args += map_folder('/tmp/.X11-unix', '/tmp/.X11-unix')
        args += set_env_var('DISPLAY', os.environ['DISPLAY'])

    args += ['-it', '--rm', '--name', 'dev-test', 'local:jdms-dev']

    args += command
    
    run_with_x(args)

def main(argv):

    if len(argv) == 1:
        print("docker command needs at least one argument")
        return 1

    command = argv[1]

    if command == 'build':
        return build_images()

    if command == 'remove':
        return remove_images()

    if command == 'emacs':
        return start_container(['/usr/bin/emacs', '--chdir', '/project/jdms'])

    if command == 'xterm':
        return start_container(['/usr/bin/uxterm', '-fg', 'wheat1', '-bg', 'black', '-fa', 'Monospace', '-fs', '10'])

    return 0

if __name__ == "__main__":
    import sys

    exit( main(sys.argv) )
