import jdms_docker

def main(argv):


    if len(argv) == 1:
        print('I need at least one command')
        return 1

    command = argv[1]

    if command == 'docker':
        return jdms_docker.main(argv[1:])
    
    print('Unknown command: {}'.format(command))
    return 1

if __name__ == "__main__":
    import sys

    exit( main(sys.argv) )


