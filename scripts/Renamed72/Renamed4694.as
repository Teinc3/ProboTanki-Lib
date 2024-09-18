package Renamed72
{
   import Renamed1.Renamed6441;
   import Renamed1.Renamed6982;
   import Renamed1.Renamed6939;
   import Renamed1.Renamed3263;
   import Renamed1.Renamed6936;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed832;
   import Renamed356.Renamed616;
   import Renamed384.Renamed8354;
   import Renamed89.Renamed6935;
   import Renamed89.Renamed9469;
   
   public class Renamed4694 extends Renamed832 implements Renamed8354, Renamed6441
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const Renamed10257:Number = 100;
      
      private var Renamed2460:Renamed616;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:Renamed9469;
      
      private var Renamed9471:Renamed6935;
      
      private var Renamed9472:Renamed3263;
      
      private var Renamed9473:Renamed6982;
      
      private var Renamed9474:Renamed6982;
      
      public function Renamed4694(param1:Renamed616, param2:Number, param3:Number, param4:Renamed9469)
      {
         super();
         this.Renamed2460 = param1;
         this.range = param2;
         this.coneAngle = param3;
         this.sfxData = param4;
      }
      
      public function Renamed8366(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         var _loc4_:Renamed1442 = null;
         var _loc5_:Renamed3265 = null;
         var _loc6_:Vector3 = null;
         var _loc7_:Renamed3265 = null;
         var _loc8_:Renamed6939 = null;
         var _loc9_:Renamed6936 = null;
         if(this.Renamed9471 == null)
         {
            this.Renamed9471 = Renamed6935(this.Renamed2460.getObject(Renamed6935));
            this.Renamed9471.init(param1,this.range,this.coneAngle,Renamed10258.Renamed9482,param2,param3,this.sfxData,Renamed619().Renamed692(),Renamed10258.Renamed3500,Renamed10258.Renamed3501,Renamed10258.Renamed9483,Renamed10258.Renamed9484,Renamed10258.Renamed10259,Renamed10258.Renamed10260);
            battleService.Renamed621().Renamed636(this.Renamed9471);
            _loc4_ = Renamed1442.create(this.sfxData.Renamed9487,Renamed10258.Renamed3749);
            this.Renamed9472 = Renamed3263(this.Renamed2460.getObject(Renamed3263));
            this.Renamed9472.Renamed7001(_loc4_,param3,this);
            Renamed619().Renamed801().Renamed1121(this.Renamed9472);
            this.Renamed9473 = Renamed6982(this.Renamed2460.getObject(Renamed6982));
            _loc5_ = Renamed3265(this.Renamed2460.getObject(Renamed3265));
            _loc6_ = new Vector3();
            _loc6_.copy(param2);
            _loc6_.z += this.Renamed10257;
            _loc5_.init(param3,param2);
            _loc5_.init(param3,param2,0);
            _loc7_ = Renamed3265(this.Renamed2460.getObject(Renamed3265));
            _loc7_.init(param3,_loc6_);
            _loc7_.init(param3,_loc6_,0);
            this.Renamed9473.init(_loc7_,this.sfxData.Renamed9476,this.sfxData.Renamed9477);
            battleService.Renamed621().Renamed636(this.Renamed9473);
            this.Renamed9474 = Renamed6982(this.Renamed2460.getObject(Renamed6982));
            _loc8_ = Renamed6939(this.Renamed2460.getObject(Renamed6939));
            _loc8_.init(param3,param2,Renamed619().Renamed692(),Renamed10258.Renamed9479);
            _loc9_ = Renamed6936(this.Renamed2460.getObject(Renamed6936));
            _loc9_.init(this.Renamed9471,_loc8_);
            this.Renamed9474.init(_loc9_,this.sfxData.Renamed9480,this.sfxData.Renamed9481);
            battleService.Renamed621().Renamed636(this.Renamed9474);
         }
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

