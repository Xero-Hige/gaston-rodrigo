#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from hashlib import md5 as MD5
from itertools import product as combinations

def decrypt (hashed_pass,possible_passwords):
    """Dado un password encriptado mediante MD5 y una lista de posibles passwords,
        devuelve el password que fue encriptado o None en caso que ninguno matchee"""
    for password in possible_passwords:
        if MD5(password).hexdigest() == hashed_pass:
            return password
    return None

def print_password(password,line_number):
    """Imprime por consola el password que se le pasa conjuntamente con el numero
        de linea. Si password es None, imprime un mensaje de error"""
    if not password:
        print "Line "+str(line_number)+": Error, no matching password"
    else:
        print "Line "+str(line_number)+": Password '"+password+"' matches"

     
def match_passwords_file(pass_file,password_len):
    """ """
    letter_list=[ chr(x) for x in range(32,127)]
    possible_passwords = ["".join(x) for x in combinations(letter_list,repeat=password_len)]

    line_number = 0

    for line in pass_file:
        line_number += 1
        line = line.rstrip()

        password = decrypt(line,possible_passwords);
        print_password(password)

def find_salt(possible_passwords,possible_salts,hashed_pass):
    """ """
    for password in possible_passwords:
        for salt in possible_salts:
            salted_pass = "".join([password,salt])
            if MD5(salted_pass).hexdigest() == hashed_pass:
                return password,salt
    return None,None

def match_salted_passwords(pass_file,password_len,salt_len):
    """ """
    letter_list=[ chr(x) for x in range(32,127) ]
    possible_passwords = ["".join(x) for x in combinations(letter_list,repeat=password_len)]
    possible_salts =  ["".join(x) for x in combinations(letter_list,repeat=salt_len)]

    line_number = 0

    line = pass_file.readline().rstrip()

    password,salt = find_salt(possible_passwords,possible_salts,line)
    print_password(password,line_number)

    while not salt:
        line_number += 1
        password,salt = find_salt(possible_passwords,possible_salts,line)
        print_password(password,line_number)
        
    possible_passwords = [ x+salt for x in possible_passwords ]

    for line in pass_file:
        line_number += 1
        line = line.rstrip()

        password = decrypt(line,possible_passwords);
        if password:
            password = password[:password_len-salt_len-1]
        print_password(password,line_number)


def main (argv):
    """ """
    if len(argv) < 3:
        print "Uso tp2.py <password_file> <password_len> [<salt_len>]"
        return 1

    password_file = argv[1]

    try:
        password_len = int(argv[2])
    except:
        print "La longitud debe ser un numero natural"
        return 1

    try:
        pass_file = open(password_file)
    except IOError:
        print "Error de apertura del archivo"
        return 1

    if len(argv) == 4:
        try:
            salt_len = int(argv[3])
        except:
            salt_len = 0
    
    if salt_len == 0:
        match_passwords_file(pass_file,password_len)
    else:
        match_salted_passwords(pass_file,password_len,salt_len)

if __name__ == "__main__":
    main(sys.argv)