package Renamed189
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class AbstractPacket
   {
      public static var Renamed5812:Renamed536;
      
      public static const Renamed5813:int = 8;
      
      private var length:int = 8;
      
      private var Renamed5814:Vector.<ICodec>;
      
      private var objectList:Vector.<Object>;
      
      private var Renamed5815:ByteArray;
      
      public function AbstractPacket()
      {
         this.Renamed5814 = new Vector.<ICodec>();
         this.objectList = new Vector.<Object>();
         this.Renamed5815 = new ByteArray();
         super();
         Renamed5812 = Renamed536(OSGi.getInstance().getService(Renamed536));
      }
      
      public function wrap(param1:ByteArray) : void
      {
         var _loc2_:int = int(param1.position);
         var _loc3_:int = Renamed5813;
         param1.writeInt(_loc3_);
         param1.writeInt(this.getPacketId());
         var _loc4_:int = 0;
         while(_loc4_ < this.Renamed5814.length)
         {
            _loc3_ += this.Renamed5814[_loc4_].encode(this.Renamed5815,this.objectList[_loc4_]);
            _loc4_++;
         }
         Renamed5812.Renamed5816().encrypt(this.Renamed5815);
         param1.writeBytes(this.Renamed5815);
         this.Renamed5815.clear();
         this.Renamed5815.position = 0;
         var _loc5_:int = int(param1.position);
         param1.position = _loc2_;
         param1.writeInt(_loc3_);
         param1.position = _loc5_;
         this.setLength(_loc3_);
      }
      
      public function unwrap(param1:ByteArray) : void
      {
         var _loc3_:Object = null;
         param1.position = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed5814.length)
         {
            _loc3_ = this.Renamed5814[_loc2_].decode(param1);
            this.Renamed4881(_loc3_,_loc2_);
            _loc2_++;
         }
      }
      
      public function Renamed1258(param1:Object) : void
      {
         this.objectList.push(param1);
      }
      
      public function Renamed4880(param1:String) : void
      {
         this.Renamed5814.push(Renamed5812.getCodec(param1));
      }
      
      public function setLength(param1:int) : void
      {
         this.length = param1;
      }
      
      public function getLength() : int
      {
         return this.length;
      }
      
      public function Renamed4882() : AbstractPacket
      {
         throw new Error("AbstractPacket::getReference must be overrided!");
      }
      
      public function Renamed4881(param1:Object, param2:int) : void
      {
         throw new Error("Not implemented");
      }
      
      public function Renamed4883() : int
      {
         return 0;
      }
      
      public function getPacketId() : int
      {
         return 0;
      }
      
      public function toString() : String
      {
         return "AbstractPacket[length = " + this.length + ", id = " + this.getPacketId() + "]";
      }
   }
}

