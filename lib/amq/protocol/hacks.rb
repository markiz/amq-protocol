# encoding: binary

# Ruby doesn't support pack to/unpack from
# 64bit string in network byte order.
module AMQ
  module Hacks
    BIG_ENDIAN = ([1].pack("s") == "\x00\x01")
    Q = "Q"

    if BIG_ENDIAN
      def self.pack_64_big_endian(long_long)
        [long_long].pack(Q)
      end

      def self.unpack_64_big_endian(data)
        data.unpack(Q)
      end
    else
      def self.pack_64_big_endian(long_long)
        result = [long_long].pack(Q)
        result[1..-1] + result[0]
      end

      def self.unpack_64_big_endian(data)
        data = data[-1] + data[0..-2]
        data.unpack(Q)
      end
    end
  end
end

# AMQ::Hacks.pack_64_big_endian(17)
# AMQ::Hacks.unpack_64_big_endian("\x00\x00\x00\x00\x00\x00\x00\x11")
