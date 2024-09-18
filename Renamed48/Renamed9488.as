package Renamed48
{
   import Renamed1.Renamed6441;
   import Renamed1.Renamed6982;
   import Renamed1.Renamed6939;
   import Renamed1.Renamed3263;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed832;
   import Renamed356.Renamed616;
   import Renamed384.Renamed8354;
   import Renamed89.Renamed6935;
   import Renamed89.Renamed9469;
   
   public class Renamed9470 extends Renamed832 implements Renamed8354, Renamed6441
   {
      private var Renamed2460:Renamed616;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:Renamed9469;
      
      private var Renamed9471:Renamed6935;
      
      private var Renamed9472:Renamed3263;
      
      private var Renamed9473:Renamed6982;
      
      private var Renamed9474:Renamed6982;
      
      public function Renamed9470(param1:Renamed616, param2:Number, param3:Number, param4:Renamed9469)
      {
         super();
         this.Renamed2460 = param1;
         this.range = param2;
         this.coneAngle = param3;
         this.sfxData = param4;
      }
      
      public function Renamed8366(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         if(this.Renamed9471 == null)
         {
            this.Renamed6445(param1,param2,param3);
            this.Renamed5252(param3);
            this.Renamed9475(param2,param3);
         }
      }
      
      public function Renamed9475(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed3265 = null;
         var _loc4_:Renamed6939 = null;
         if(this.Renamed9473 == null)
         {
            this.Renamed9473 = Renamed6982(this.Renamed2460.getObject(Renamed6982));
            _loc3_ = Renamed3265(this.Renamed2460.getObject(Renamed3265));
            _loc3_.init(param2,param1);
            this.Renamed9473.init(_loc3_,this.sfxData.Renamed9476,this.sfxData.Renamed9477);
            battleService.Renamed621().Renamed636(this.Renamed9473);
         }
         if(this.Renamed9474 == null)
         {
            this.Renamed9474 = Renamed6982(this.Renamed2460.getObject(Renamed6982));
            _loc4_ = Renamed6939(this.Renamed2460.getObject(Renamed6939));
            _loc4_.init(param2,param1,Renamed619().Renamed692(),Renamed9478.Renamed9479);
            this.Renamed9474.init(_loc4_,this.sfxData.Renamed9480,this.sfxData.Renamed9481);
            battleService.Renamed621().Renamed636(this.Renamed9474);
         }
      }
      
      private function Renamed6445(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         this.Renamed9471 = Renamed6935(this.Renamed2460.getObject(Renamed6935));
         this.Renamed9471.init(param1,this.range,this.coneAngle,Renamed9478.Renamed9482,param2,param3,this.sfxData,Renamed619().Renamed692(),Renamed9478.Renamed3500,Renamed9478.Renamed3501,Renamed9478.Renamed9483,Renamed9478.Renamed9484,Renamed9478.Renamed9485,Renamed9478.Renamed9486);
         battleService.Renamed621().Renamed636(this.Renamed9471);
      }
      
      private function Renamed5252(param1:Object3D) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.Renamed9487,Renamed9478.Renamed3749);
         this.Renamed9472 = Renamed3263(this.Renamed2460.getObject(Renamed3263));
         this.Renamed9472.Renamed7001(_loc2_,param1,this);
         Renamed619().Renamed801().Renamed1121(this.Renamed9472);
      }
      
      public function Renamed3062() : void
      {
         if(this.Renamed9471 != null)
         {
            this.Renamed9471.kill();
            this.Renamed9471 = null;
            this.Renamed2377();
            this.Renamed9473.stop();
            this.Renamed9473 = null;
            this.Renamed9474.stop();
            this.Renamed9474 = null;
         }
      }
      
      private function Renamed2377() : void
      {
         if(this.Renamed9472 != null)
         {
            this.Renamed9472.kill();
            this.Renamed9472 = null;
         }
      }
      
      public function Renamed6447(param1:Renamed608) : void
      {
         if(this.Renamed9472 == param1)
         {
            this.Renamed9472 = null;
         }
      }
   }
}

