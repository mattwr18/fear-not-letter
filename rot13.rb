require 'pry'

def rot13(string)
  array = []
  # Verificar se e um caracter valido
  # Somar 13 aos bytes
  #
  string.upcase.each_byte do |byte|
    aux = if byte >= 65 && byte <= 90
        if (soma = byte + 13) > 90
          64 + soma % 90
        else
          byte + 13
        end
      else
        byte
      end
      array << aux.chr
    end
    array.join("")
  end

puts rot13("SERR CVmmn!")
puts rot13("SeRR yBIR?")
puts rot13("GUR DHVPX OEBJA QBT WHZCRQ BIRE GUR YNML SBK.")
