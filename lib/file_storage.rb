require 'fileutils'
require 'base64'
module Storage

  #Metodo que abre y codifica un archivo en Base64
  def recieveFile(filename)
    #Se abre un archivo con el nombre de entrada
    archivo = File.open(filename, 'r')
    #Se codifica el archivo
    codificado = Base64.encode64(archivo.read)
    #Se cierra archivo    
    archivo.close
    #Se retorna el archivo codificado
    codificado
  end

  #Metodo que decodifica un archivo
  def decodeFile(filename)
    #Se abre el archivo 
    archivo = File.open(filename, 'r')
    #Se extrae el contenido
    content = archivo.read
    #Se cierra el archivo
    archivo.close
    #Se decodifica y retorna el archivo
    Base64.decode64(content)
  end

  #Metodo que escribe un contenido en un archivo
  def writeFile(filename, content)
    #Se abre el archivo a escribir
    archivo = File.open(filename, 'w')
    #Se escribe el contenido
    archivo.puts(content)
    #Se cierra el archivo
    archivo.close
    nil
  end

end
  
class Test
  include Storage
  def initialize
    #Se emula la recepcion de un archivo en el mismo directorio
    #Se prueban imágenes. 
    writeFile("Bridge.txt",recieveFile('Especialista.jpg'))
    #Luego se decodifica y guarda para verificar. La primera es la ruta. Puedo hacerlo donde desee
    writeFile("../../FotoRecibida.jpg", decodeFile('Bridge.txt'))
    #Luego se prueban PDF.            
    writeFile("Bridge.txt",recieveFile('PDFTest.pdf'))
    #Luego se decodifica y guarda para verificar. La primera es la ruta. Puedo $
    writeFile("../../PDFRecibido.pdf", decodeFile('Bridge.txt'))

  end
end

Test.new
