# RSA_ChosenCiphertextAttack
Attacks against plain RSA (When RSA does not padding) and it is able to send arbitrary cipher  for server to decrypt.

* example.rb  
  * The file to generate such attack
   * First output is the ciphertext, which flag ** e mod N
   * First input is the (int) that will be decrypt
   * Second output is the decryption result of your input
* rsachosenciphertextattack_api.rb
  * The file to provide api to do the attack  
   * Usage  
```ruby
a = RSACCA.new(n, e, c) #Input your n, e, c
payload = a.chosencipher
#send out your payload
res = # recv the dec(payload)
p a.exploit(res) #print out m in int
p a.to_str #print out m in string
```
*This attack doesnot provide tool. Since that in this attack api is more convenient than tool.*  

**Why this work**  
  [wiki](https://en.wikipedia.org/wiki/RSA_(cryptosystem))  in padding / Attacks against plain RSA / point 4
