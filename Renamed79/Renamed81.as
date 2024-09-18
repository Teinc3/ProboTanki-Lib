package Renamed79
{
   import Renamed136.Renamed663;
   import Renamed602.Renamed603;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import Renamed77.Renamed4701;
   import Renamed77.Renamed78;
   import Renamed77.Renamed10276;
   
   public class Renamed81 extends Renamed10276 implements Renamed80, Renamed4701
   {
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed81()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7301(param1:ClientObject, param2:Number) : void
      {
         if(!isNaN(param2))
         {
            this.Renamed10321(param1,param2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7299(param1:ClientObject, param2:ClientObject, param3:Renamed603) : void
      {
         if(param2 == null || Renamed668.Renamed699(param3))
         {
            return;
         }
         var _loc4_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         this.Renamed10322(param1,_loc4_.getTankData(param2).tank,Renamed668.Renamed681(param3));
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7300(param1:ClientObject) : void
      {
         this.Renamed10323(param1);
      }
      
      public function Renamed7194(param1:Vector3) : void
      {
         var _loc2_:Matrix3 = Renamed668.Renamed670;
         _loc2_.setRotationMatrixForObject3D(Renamed775.Renamed824.tank.Renamed1020());
         var _loc3_:Vector3 = Renamed668.Renamed669;
         _loc2_.getUp(_loc3_);
         var _loc4_:Number = _loc3_.dot(param1);
         if(this.Renamed10321(Renamed775.Renamed824.user,_loc4_))
         {
            server.Renamed7194(_loc4_);
         }
      }
      
      public function Renamed7192(param1:Tank, param2:Vector3) : void
      {
         if(this.Renamed10322(Renamed775.Renamed824.user,param1,param2))
         {
            server.Renamed7192(param1.Renamed695(),Renamed668.Renamed677(param2));
         }
      }
      
      public function Renamed7195() : void
      {
         if(this.Renamed10323(Renamed775.Renamed824.user))
         {
            server.hide();
         }
      }
      
      public function Renamed10321(param1:ClientObject, param2:Number) : Boolean
      {
         this.Renamed10324(param1);
         var _loc3_:Renamed2769 = Renamed2769(param1.getParams(Renamed2769));
         return _loc3_.Renamed7194(param2);
      }
      
      private function Renamed10322(param1:ClientObject, param2:Tank, param3:Vector3) : Boolean
      {
         this.Renamed10324(param1);
         var _loc4_:Renamed2769 = Renamed2769(param1.getParams(Renamed2769));
         return _loc4_.Renamed7192(param2,param3);
      }
      
      private function Renamed10324(param1:ClientObject) : void
      {
         var _loc2_:Renamed2769 = this.Renamed10325(param1);
         if(_loc2_.isVisible())
         {
            return;
         }
         var _loc3_:Tank = this.getTank(param1);
         var _loc4_:Boolean = _loc3_.tankData.local;
         if(_loc4_)
         {
            _loc2_.Renamed10306();
            return;
         }
         _loc2_.show(this.Renamed3335(_loc3_.tankData.turret,_loc3_.teamType));
      }
      
      private function Renamed10325(param1:ClientObject) : Renamed2769
      {
         var _loc2_:Renamed2769 = Renamed2769(param1.getParams(Renamed2769));
         var _loc3_:Renamed78 = Renamed78(this.getTank(param1).tankData.turret.getParams(Renamed78));
         if(_loc2_ == null)
         {
            _loc2_ = new Renamed2769(_loc3_.fadeInTimeMs,this.getTank(param1));
            param1.putParams(Renamed2769,_loc2_);
         }
         return _loc2_;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         return Renamed2408(OSGi.getInstance().getService(Renamed2408)).getTankData(param1).tank;
      }
      
      private function Renamed10323(param1:ClientObject) : Boolean
      {
         var _loc2_:Renamed2769 = Renamed2769(param1.getParams(Renamed2769));
         if(Boolean(_loc2_) && _loc2_.isVisible())
         {
            _loc2_.hide();
            return true;
         }
         return false;
      }
      
      private function Renamed3335(param1:ClientObject, param2:Renamed663) : uint
      {
         switch(param2)
         {
            case Renamed663.BLUE:
               return this.Renamed3338(param1);
            case Renamed663.RED:
               return this.getLaserPointerRedColor(param1);
            default:
               return this.getLaserPointerRedColor(param1);
         }
      }
      
      public function Renamed3338(param1:ClientObject) : uint
      {
         var _loc2_:Renamed78 = Renamed78(param1.getParams(Renamed78));
         return uint(_loc2_.laserPointerBlueColor);
      }
      
      public function getLaserPointerRedColor(param1:ClientObject) : uint
      {
         var _loc2_:Renamed78 = Renamed78(param1.getParams(Renamed78));
         return uint(_loc2_.laserPointerRedColor);
      }
   }
}

