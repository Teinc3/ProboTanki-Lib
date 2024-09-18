package §true catch null§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §<!b§
   {
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      private var §3!D§:Vector3;
      
      private var self:ClientObject;
      
      private var §1#0§:Number;
      
      public function §<!b§(param1:ClientObject, param2:Number)
      {
         this.§3!D§ = new Vector3();
         super();
         this.self = param1;
         this.§1#0§ = param2;
      }
      
      public function §true for var§(param1:§ !8§) : Vector.<§&"g§>
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Vector.<§&"g§> = new Vector.<§&"g§>();
         this.§3!D§.cross2(param1.§false var try§,param1.direction);
         for each(_loc2_ in §9#A§.§ !c§())
         {
            if(_loc2_ != this.self)
            {
               this.§;e§(param1,this.§3!D§,this.getTank(_loc2_),_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function §;e§(param1:§ !8§, param2:Vector3, param3:Tank, param4:Vector.<§&"g§>) : void
      {
         var _loc5_:Vector3 = §+$%§.§@!c§;
         _loc5_.diff(param3.§0"t§().state.position,param1.§if package var§);
         var _loc6_:Number = _loc5_.length();
         var _loc7_:Number = Math.max(0,_loc5_.length() - param3.§&#[§());
         if(_loc7_ > this.§1#0§)
         {
            return;
         }
         var _loc8_:Vector3 = param1.§false var try§;
         var _loc9_:Vector3 = param1.direction;
         var _loc10_:Number = _loc5_.dot(_loc8_);
         var _loc11_:Number = _loc5_.dot(_loc9_);
         var _loc12_:Number = _loc5_.dot(param2);
         var _loc13_:Number = Math.atan2(_loc10_,_loc11_);
         var _loc14_:Number = Math.atan2(_loc12_,_loc11_);
         var _loc15_:Number = Math.min(param3.§&#[§(),_loc6_);
         var _loc18_:Number;
         if(Math.abs(_loc13_) > (_loc18_ = Math.asin(_loc15_ / _loc6_)))
         {
            return;
         }
         var _loc19_:§return for while§ = WeaponsManager.shotDatas[this.getTank(this.self).tankData.turret.id];
         var _loc20_:Number = Math.max(_loc14_ - _loc18_,-_loc19_.§static var return§());
         var _loc21_:Number = Math.min(_loc14_ + _loc18_,_loc19_.§2!H§());
         if(_loc20_ < _loc21_)
         {
            param4.push(new §&"g§(_loc20_,_loc21_,_loc7_,param3));
         }
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         return _loc2_.getTankData(param1).tank;
      }
   }
}

