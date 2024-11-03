package Renamed439
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed4715
   {
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      private var Renamed6955:Vector3;
      
      private var self:ClientObject;
      
      private var Renamed6525:Number;
      
      public function Renamed4715(param1:ClientObject, param2:Number)
      {
         this.Renamed6955 = new Vector3();
         super();
         this.self = param1;
         this.Renamed6525 = param2;
      }
      
      public function Renamed8915(param1:Renamed664) : Vector.<Renamed3533>
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Vector.<Renamed3533> = new Vector.<Renamed3533>();
         this.Renamed6955.cross2(param1.Renamed3025,param1.direction);
         for each(_loc2_ in Renamed2775.Renamed2895())
         {
            if(_loc2_ != this.self)
            {
               this.Renamed8916(param1,this.Renamed6955,this.getTank(_loc2_),_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function Renamed8916(param1:Renamed664, param2:Vector3, param3:Tank, param4:Vector.<Renamed3533>) : void
      {
         var _loc5_:Vector3 = Renamed668.Renamed669;
         _loc5_.diff(param3.Renamed696().state.position,param1.Renamed689);
         var _loc6_:Number = _loc5_.length();
         var _loc7_:Number = Math.max(0,_loc5_.length() - param3.Renamed852());
         if(_loc7_ > this.Renamed6525)
         {
            return;
         }
         var _loc8_:Vector3 = param1.Renamed3025;
         var _loc9_:Vector3 = param1.direction;
         var _loc10_:Number = _loc5_.dot(_loc8_);
         var _loc11_:Number = _loc5_.dot(_loc9_);
         var _loc12_:Number = _loc5_.dot(param2);
         var _loc13_:Number = Math.atan2(_loc10_,_loc11_);
         var _loc14_:Number = Math.atan2(_loc12_,_loc11_);
         var _loc15_:Number = Math.min(param3.Renamed852(),_loc6_);
         var _loc18_:Number;
         if(Math.abs(_loc13_) > (_loc18_ = Math.asin(_loc15_ / _loc6_)))
         {
            return;
         }
         var _loc19_:Renamed86 = WeaponsManager.shotDatas[this.getTank(this.self).tankData.turret.id];
         var _loc20_:Number = Math.max(_loc14_ - _loc18_,-_loc19_.Renamed3053());
         var _loc21_:Number = Math.min(_loc14_ + _loc18_,_loc19_.Renamed3051());
         if(_loc20_ < _loc21_)
         {
            param4.push(new Renamed3533(_loc20_,_loc21_,_loc7_,param3));
         }
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         return _loc2_.getTankData(param1).tank;
      }
   }
}

