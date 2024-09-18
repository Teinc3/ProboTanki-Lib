package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.§ #^§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   
   public class §,X§ implements § #^§
   {
      [Inject]
      public static var §else const case§:TankUsersRegistry;
      
      public function §,X§()
      {
         super();
      }
      
      public function §^!=§(param1:String, param2:String, param3:int, param4:Boolean) : void
      {
         var _loc5_:§in for for§ = null;
         var _loc6_:UserTitle = null;
         var _loc7_:§2!s§ = this.§extends set do§(param1);
         if(_loc7_ != null)
         {
            (_loc5_ = _loc7_.§,m§(§else const case§.§if for with§(param1))).name = param2;
            _loc5_.rank = param3;
            _loc6_ = _loc7_.getTitle(§else const case§.§if for with§(param1));
            if(_loc6_ != null)
            {
               _loc6_.setLabelText(param2);
               _loc6_.setRank(param3);
               _loc6_.setSuspicious(param4);
            }
         }
      }
      
      public function §!D§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§2!s§ = null;
         var _loc4_:UserTitle = null;
         var _loc5_:ClientObject = §else const case§.§if for with§(param1);
         if(_loc5_ != null)
         {
            _loc3_ = this.§extends set do§(param1);
            _loc4_ = _loc3_.getTitle(_loc5_);
            if(_loc4_ != null)
            {
               _loc4_.setSuspicious(param2);
            }
         }
      }
      
      public function §,4§(param1:String, param2:int) : void
      {
         var _loc3_:§in for for§ = null;
         var _loc4_:UserTitle = null;
         var _loc5_:§2!s§ = this.§extends set do§(param1);
         if(_loc5_ != null)
         {
            _loc3_ = _loc5_.§,m§(§else const case§.§if for with§(param1));
            _loc3_.rank = param2;
            _loc4_ = _loc5_.getTitle(§else const case§.§if for with§(param1));
            if(_loc4_ != null)
            {
               _loc4_.setRank(param2);
            }
         }
      }
      
      private function §extends set do§(param1:String) : §2!s§
      {
         var _loc2_:ClientObject = §else const case§.§if for with§(param1);
         if(_loc2_ != null)
         {
            return §2!s§(OSGi.getInstance().getService(§finally var return§));
         }
         return null;
      }
   }
}

