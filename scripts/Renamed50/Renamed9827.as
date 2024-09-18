package Renamed50
{
   import Renamed1.Renamed6906;
   import Renamed1.Renamed6982;
   import Renamed1.Renamed3265;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import Renamed82.Renamed8544;
   
   public class Renamed9827 implements Renamed9752
   {
      private var battleService:BattleService;
      
      private var sfxData:Renamed9775;
      
      private var turret:Object3D;
      
      private var Renamed9828:Vector3;
      
      private var Renamed9829:Vector3;
      
      private var Renamed9471:Renamed9830;
      
      private var Renamed9472:Renamed9791;
      
      private var Renamed9474:Renamed6982;
      
      private var Renamed9831:Renamed6906;
      
      private var Renamed9832:Renamed8544;
      
      public function Renamed9827(param1:BattleService, param2:Renamed9775)
      {
         this.Renamed9829 = new Vector3();
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function init(param1:Object3D, param2:Vector3) : void
      {
         this.turret = param1;
         this.Renamed9828 = param2.clone();
      }
      
      public function Renamed9811(param1:Renamed8544, param2:Tank = null, param3:Vector3 = null) : void
      {
         this.Renamed9833(true,param1);
         this.Renamed9834(param1,param2,param3);
         this.Renamed9472.type = param1;
      }
      
      public function Renamed9835(param1:Renamed8544, param2:Tank = null, param3:Vector3 = null) : void
      {
         this.Renamed9833(false,param1);
         this.Renamed9834(param1,param2,param3);
         this.Renamed9472.type = param1;
      }
      
      private function Renamed9833(param1:Boolean, param2:Renamed8544) : void
      {
         if(this.Renamed9471 == null)
         {
            this.Renamed6445(param1);
            this.Renamed5252();
            this.Renamed9475(param2);
         }
         else if(param2 != this.Renamed9832)
         {
            this.Renamed9475(param2);
         }
      }
      
      private function Renamed9475(param1:Renamed8544) : void
      {
         if(this.Renamed9474 != null)
         {
            this.Renamed9836();
         }
         this.Renamed9474 = Renamed6982(this.battleService.Renamed618().getObject(Renamed6982));
         var _loc2_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc2_.init(this.turret,this.Renamed9828);
         switch(param1)
         {
            case Renamed8544.DAMAGING:
               this.Renamed9474.init(_loc2_,this.sfxData.Renamed9787,this.sfxData.Renamed9788);
               break;
            case Renamed8544.HEALING:
               this.Renamed9474.init(_loc2_,this.sfxData.Renamed9785,this.sfxData.Renamed9786);
               break;
            default:
               this.Renamed9474.init(_loc2_,this.sfxData.Renamed9476,this.sfxData.Renamed9477);
         }
         this.Renamed9832 = param1;
         this.battleService.Renamed636(this.Renamed9474);
      }
      
      private function Renamed9836() : void
      {
         this.Renamed9474.stop();
         this.Renamed9474 = null;
      }
      
      private function Renamed6445(param1:Boolean) : void
      {
         this.Renamed9471 = Renamed9830(this.battleService.Renamed618().getObject(Renamed9830));
         if(param1)
         {
            this.Renamed9471.Renamed9837(this.sfxData,this.turret,this.Renamed9828);
         }
         else
         {
            this.Renamed9471.Renamed9838(this.sfxData,this.turret,this.Renamed9828);
         }
         this.battleService.Renamed636(this.Renamed9471);
      }
      
      private function Renamed5252() : void
      {
         this.Renamed9472 = Renamed9791(this.battleService.Renamed618().getObject(Renamed9791));
         this.Renamed9472.init(this.sfxData,this.turret);
         this.battleService.Renamed637(this.Renamed9472);
      }
      
      private function Renamed9834(param1:Renamed8544, param2:Tank, param3:Vector3) : void
      {
         var _loc4_:Mesh = null;
         if(param1 == Renamed8544.IDLE)
         {
            this.Renamed9471.Renamed9839(param1);
         }
         else
         {
            _loc4_ = param2.Renamed1023();
            this.Renamed9829.copy(param3);
            this.Renamed9829.subtract(param2.Renamed1006());
            this.Renamed9471.Renamed9839(param1,_loc4_,this.Renamed9829);
         }
         this.Renamed9840(param1,param2,this.Renamed9829);
      }
      
      private function Renamed9840(param1:Renamed8544, param2:Tank, param3:Vector3) : void
      {
         if(this.Renamed9831 != null)
         {
            this.Renamed9831.kill();
            this.Renamed9831 = null;
         }
         if(param1 == Renamed8544.IDLE || param1 == Renamed8544.OFF)
         {
            return;
         }
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         var _loc5_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(this.turret,this.Renamed9828);
         _loc5_.init(param2.Renamed1023(),param3);
         this.Renamed9831 = Renamed6906(this.battleService.Renamed618().getObject(Renamed6906));
         switch(param1)
         {
            case Renamed8544.DAMAGING:
               this.Renamed9831.init(_loc4_,_loc5_,this.sfxData.Renamed9790,true);
               break;
            case Renamed8544.HEALING:
               this.Renamed9831.init(_loc4_,_loc5_,this.sfxData.Renamed9789,true);
         }
         this.battleService.Renamed636(this.Renamed9831);
      }
      
      public function Renamed3062() : void
      {
         if(this.Renamed9471 != null)
         {
            this.Renamed9471.stop();
            this.Renamed9472.kill();
            this.Renamed9474.stop();
            if(this.Renamed9831 != null)
            {
               this.Renamed9831.kill();
            }
            this.Renamed9471 = null;
            this.Renamed9472 = null;
            this.Renamed9474 = null;
            this.Renamed9831 = null;
         }
      }
   }
}

