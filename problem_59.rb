require_relative 'euler'

# Problem 59
# 19 December 2003
# Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
# A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
# For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.
# Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
# Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher1.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

A = `cat cipher1.txt`.scan(/\d+/).collect(&:to_i)
A.zip([B=[],C=[],D=[]]*(A.size/3+1)){|e,ary|ary<<e}

Letters = ?a.ord..?z.ord

class Array
  def quality
    grep(Letters).size / size.to_f
  end
  def cipher(*key)
    zip(key*self.size).collect{|a,b|a^b}
  end
end

Letters.detect_max{|k|B.cipher(k).quality}.should == ?g.ord
Letters.detect_max{|k|C.cipher(k).quality}.should == ?o.ord
Letters.detect_max{|k|D.cipher(k).quality}.should == ?d.ord

A.cipher(*'god'.each_byte).sum.should == 107359
A.cipher(*'god'.each_byte).collect(&:chr).join.should =~ /The Gospel of John/



