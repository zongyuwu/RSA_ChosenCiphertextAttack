#!/usr/bin/env ruby

require 'openssl'

class RSACCA
  def initialize(n=nil, e=65537, c=nil)
    @N = n.to_i
    @E = e.to_i
    @C = c.to_i
    @r = 3
    @rr = nil
    @M = nil
    raise "Not enough argvment to solve" if sanitycheck == false
  end

  def chosencipher
    @r = 3
    @rr = @r.to_bn.mod_inverse(@N).to_i
    return (@C*(@r.to_bn.mod_exp(@E, @N).to_i)) % @N
  end

  def exploit(v)
    @M = (v.to_i*@rr) % @N
    return @M
  end

  def to_str
    raise "Run exploit before this" if @M.nil?
    return inttostring(@M)
  end

private
  def sanitycheck
    raise "Give me n please" if @N.nil?
    raise "Give me c please" if @C.nil?
  end

  def inttostring(c)
    c_chr = ""
    until c == 0
      c_chr = "#{c_chr}#{(c%(16**2)).chr}"
      c /= (16**2)
    end
    return c_chr.reverse
  end

end


n = 105336269582079676323010512819204625288645575328203701096975808454497688068214129491692475405720640125331749553259320732084632884409179763249233702925129782989969181227120478269480870210191585454794961655414361478687014892595211207761303760390842469853368359780299700483374445798383577541235217811928441546297
e = 65537
c = 77938551420677497116826492735923445230620582754033767371216695250679402757313157105705634894609053067613935204875554040363539974058648488784368806430751139138390667219687129519550583097295801065691205193210532451877006746591014245285767834587796432726867337468091822803474805366496953845576427580612438321928
a = RSACCA.new(n, e, c)
a.chosencipher
res = `echo #{a.chosencipher} | ruby ./example.rb `.to_i
p a.exploit(res)
p a.to_str
