require 'fileutils'
require 'base64'
module Storage
  class Utils
    # Metodo que abre y codifica un archivo en Base64
    def self.encode_file(filename)
      # Se abre un archivo con el nombre de entrada
      file = File.open(filename, 'r')
      # Se codifica el archivo
      encoded = Base64.encode64(file.read)
      # Se cierra archivo
      file.close
      # Se retorna el archivo codificado
      encoded
    end

    # Metodo que decodifica un archivo
    def self.decode_file(filename)
      # Se abre el archivo
      file = File.open(filename, 'r')
      # Se extrae el contenido
      content = file.read
      # Se cierra el archivo
      file.close
      # Se decodifica y retorna el archivo
      Base64.decode64(content)
    end

    # Metodo que escribe un contenido en un archivo
    def self.write_file(filename, content)
      # Se abre el archivo a escribir
      file = File.open(filename, 'w')
      # Se escribe el contenido
      file.puts(content)
      # Se cierra el archivo
      file.close
      nil
    end
  end
end