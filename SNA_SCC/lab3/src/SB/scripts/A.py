from communicate.sign import boot_next

if __name__ == '__main__':
    print('booted A')
    print('waiting for B to boot...')
    boot_next('B')
    