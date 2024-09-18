package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserPropertyCC implements ICodec
   {
      private var §9#c§:ICodec;
      
      private var §try for try§:ICodec;
      
      private var §<"$§:ICodec;
      
      private var §?"]§:ICodec;
      
      private var §"a§:ICodec;
      
      private var §7#E§:ICodec;
      
      private var §get include§:ICodec;
      
      private var §default set native§:ICodec;
      
      private var §default finally§:ICodec;
      
      private var §false var true§:ICodec;
      
      private var §,!k§:ICodec;
      
      private var §each import§:ICodec;
      
      private var §each package do§:ICodec;
      
      private var §>!Y§:ICodec;
      
      private var §else var native§:ICodec;
      
      private var §"#$§:ICodec;
      
      private var § !5§:ICodec;
      
      public function CodecUserPropertyCC(param1:§?"s§)
      {
         super();
         this.§9#c§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§try for try§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§"a§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§get include§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§default set native§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§default finally§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§false var true§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§,!k§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.§each import§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§each package do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§>!Y§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§"#$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§ !5§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UserPropertyCC = new UserPropertyCC();
         _loc2_.crystals = this.§9#c§.decode(param1) as int;
         _loc2_.currentRankScore = this.§try for try§.decode(param1) as int;
         _loc2_.durationCrystalAbonement = this.§"a§.decode(param1) as int;
         _loc2_.hasDoubleCrystal = this.§get include§.decode(param1) as Boolean;
         _loc2_.nextRankScore = this.§default finally§.decode(param1) as int;
         _loc2_.place = this.§false var true§.decode(param1) as int;
         _loc2_.rank = this.§,!k§.decode(param1) as int;
         _loc2_.rating = this.§each import§.decode(param1) as Number;
         _loc2_.score = this.§each package do§.decode(param1) as int;
         _loc2_.serverNumber = this.§>!Y§.decode(param1) as int;
         _loc2_.uid = _loc2_.id = this.§"#$§.decode(param1) as String;
         _loc2_.userProfileUrl = this.§ !5§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserPropertyCC = UserPropertyCC(param2);
         this.§9#c§.encode(param1,_loc3_.crystals);
         this.§try for try§.encode(param1,_loc3_.currentRankScore);
         this.§<"$§.encode(param1,_loc3_.daysFromLastVisit);
         this.§?"]§.encode(param1,_loc3_.daysFromRegistration);
         this.§"a§.encode(param1,_loc3_.durationCrystalAbonement);
         this.§7#E§.encode(param1,_loc3_.gameHost);
         this.§get include§.encode(param1,_loc3_.hasDoubleCrystal);
         this.§default finally§.encode(param1,_loc3_.nextRankScore);
         this.§false var true§.encode(param1,_loc3_.place);
         this.§,!k§.encode(param1,_loc3_.rank);
         this.§each import§.encode(param1,_loc3_.rating);
         this.§each package do§.encode(param1,_loc3_.score);
         this.§>!Y§.encode(param1,_loc3_.serverNumber);
         this.§else var native§.encode(param1,_loc3_.templateBattlePage);
         this.§"#$§.encode(param1,_loc3_.uid);
         this.§ !5§.encode(param1,_loc3_.userProfileUrl);
         return 4;
      }
   }
}

