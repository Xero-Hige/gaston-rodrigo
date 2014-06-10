#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from hashlib import md5 as MD5
from itertools import combinations_with_replacement as combinations

def decrypt (hashed_pass,possible_passwords):
    for password in possible_passwords:
        if str(MD5(password).hexdigest()) == hashed_pass:
            return password
    return None
        
def main (argv):

    if len(argv) < 3:
        print "Uso tp2.py <password_file> <password_len>"
        return 1

    password_file = argv[1]
    
    try:
        password_len = int(argv[2])
    except:
        print "La longitud debe ser un numero natural"
        return 1

    pass_file = None    
    try:
        pass_file = open(password_file)
    except IOError:
        print "Error de apertura del archivo"
        return 1

    letter_list=[ chr(x) for x in range(256)]
    possible_passwords = ["".join(x) for x in combinations(letter_list,password_len)]

    line_number = 0

    for line in pass_file:
        line_number += 1
        line = line.rstrip()

        password = decrypt(line,possible_passwords);

        if not password:
            print "Line "+str(line_number)+": Error, no matching password"
        else:
            print "Line "+str(line_number)+": Password '"+password+"' matches"

if __name__ == "__main__":
    main(sys.argv)