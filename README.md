# RSA_ChosenCiphertextAttack
Attacks against plain RSA (When RSA does not padding) and it is able to send arbitrary cipher  for server to decrypt.

* example.rb  
  * The file to generate such attack
    * First output is the ciphertext, which flag ** e mod N
    * First input is the (int) that will be decrypt
    * Second output is the decryption result of your input


** Why this work **  
  [wiki](https://en.wikipedia.org/wiki/RSA_(cryptosystem))  in padding / Attacks against plain RSA / point 4
