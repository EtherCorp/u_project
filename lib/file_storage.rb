require 'fileutils'
require 'base64'
module Storage
  #Metodo que abre y codifica un archivo en Base64
  def recieveFile(filename)
    #Se abre un archivo con el nombre de entrada
    archivo = File.open(filename)
    #Se codifica el archivo
    codificado = Base64.encode64(archivo.read)
    #Se cierra archivo    
    archivo.close
    #Se abre el archivo que se guarda
    recibido = File.open('recieve', 'w')
    #Se escribe el codificado
    recibido.write(codificado)
    #Se cierra el codificado
    recibido.close
    nil
  end

  def decodeFile(filename)
    archivo = File.open(filename)
    codificado = Base64.decode64(archivo.read)
    recibido = File.open('pre','w')
    recibido.write(codificado)
    archivo.close
  end
end
class Test
  include Storage
  def initialize
    recieveFile('Filetest.txt')
    decodeFile('recieve')
  end
end

Test.new
