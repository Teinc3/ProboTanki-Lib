package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyCC;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecUserPropertyCC implements ICodec
   {
      private var Renamed10746:ICodec;
      
      private var Renamed10747:ICodec;
      
      private var Renamed10748:ICodec;
      
      private var Renamed10749:ICodec;
      
      private var Renamed10750:ICodec;
      
      private var Renamed10580:ICodec;
      
      private var Renamed10751:ICodec;
      
      private var Renamed8880:ICodec;
      
      private var Renamed10752:ICodec;
      
      private var Renamed10753:ICodec;
      
      private var Renamed10708:ICodec;
      
      private var Renamed10754:ICodec;
      
      private var Renamed10574:ICodec;
      
      private var Renamed10572:ICodec;
      
      private var Renamed10755:ICodec;
      
      private var Renamed10745:ICodec;
      
      private var Renamed10756:ICodec;
      
      public function CodecUserPropertyCC(param1:Renamed536)
      {
         super();
         this.Renamed10746 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10747 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10750 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10751 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed8880 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10752 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10753 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10708 = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.Renamed10754 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10574 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10572 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10745 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10756 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UserPropertyCC = new UserPropertyCC();
         _loc2_.crystals = this.Renamed10746.decode(param1) as int;
         _loc2_.currentRankScore = this.Renamed10747.decode(param1) as int;
         _loc2_.durationCrystalAbonement = this.Renamed10750.decode(param1) as int;
         _loc2_.hasDoubleCrystal = this.Renamed10751.decode(param1) as Boolean;
         _loc2_.nextRankScore = this.Renamed10752.decode(param1) as int;
         _loc2_.place = this.Renamed10753.decode(param1) as int;
         _loc2_.rank = this.Renamed10708.decode(param1) as int;
         _loc2_.rating = this.Renamed10754.decode(param1) as Number;
         _loc2_.score = this.Renamed10574.decode(param1) as int;
         _loc2_.serverNumber = this.Renamed10572.decode(param1) as int;
         _loc2_.uid = _loc2_.id = this.Renamed10745.decode(param1) as String;
         _loc2_.userProfileUrl = this.Renamed10756.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserPropertyCC = UserPropertyCC(param2);
         this.Renamed10746.encode(param1,_loc3_.crystals);
         this.Renamed10747.encode(param1,_loc3_.currentRankScore);
         this.Renamed10748.encode(param1,_loc3_.daysFromLastVisit);
         this.Renamed10749.encode(param1,_loc3_.daysFromRegistration);
         this.Renamed10750.encode(param1,_loc3_.durationCrystalAbonement);
         this.Renamed10580.encode(param1,_loc3_.gameHost);
         this.Renamed10751.encode(param1,_loc3_.hasDoubleCrystal);
         this.Renamed10752.encode(param1,_loc3_.nextRankScore);
         this.Renamed10753.encode(param1,_loc3_.place);
         this.Renamed10708.encode(param1,_loc3_.rank);
         this.Renamed10754.encode(param1,_loc3_.rating);
         this.Renamed10574.encode(param1,_loc3_.score);
         this.Renamed10572.encode(param1,_loc3_.serverNumber);
         this.Renamed10755.encode(param1,_loc3_.templateBattlePage);
         this.Renamed10745.encode(param1,_loc3_.uid);
         this.Renamed10756.encode(param1,_loc3_.userProfileUrl);
         return 4;
      }
   }
}

