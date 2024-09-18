package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.Renamed2305;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   
   public class Renamed2735 implements Renamed2305
   {
      [Inject]
      public static var Renamed2736:TankUsersRegistry;
      
      public function Renamed2735()
      {
         super();
      }
      
      public function Renamed2307(param1:String, param2:String, param3:int, param4:Boolean) : void
      {
         var _loc5_:Renamed2737 = null;
         var _loc6_:UserTitle = null;
         var _loc7_:Renamed2407 = this.Renamed2738(param1);
         if(_loc7_ != null)
         {
            (_loc5_ = _loc7_.Renamed2739(Renamed2736.Renamed695(param1))).name = param2;
            _loc5_.rank = param3;
            _loc6_ = _loc7_.getTitle(Renamed2736.Renamed695(param1));
            if(_loc6_ != null)
            {
               _loc6_.setLabelText(param2);
               _loc6_.setRank(param3);
               _loc6_.setSuspicious(param4);
            }
         }
      }
      
      public function Renamed2309(param1:String, param2:Boolean) : void
      {
         var _loc3_:Renamed2407 = null;
         var _loc4_:UserTitle = null;
         var _loc5_:ClientObject = Renamed2736.Renamed695(param1);
         if(_loc5_ != null)
         {
            _loc3_ = this.Renamed2738(param1);
            _loc4_ = _loc3_.getTitle(_loc5_);
            if(_loc4_ != null)
            {
               _loc4_.setSuspicious(param2);
            }
         }
      }
      
      public function Renamed2308(param1:String, param2:int) : void
      {
         var _loc3_:Renamed2737 = null;
         var _loc4_:UserTitle = null;
         var _loc5_:Renamed2407 = this.Renamed2738(param1);
         if(_loc5_ != null)
         {
            _loc3_ = _loc5_.Renamed2739(Renamed2736.Renamed695(param1));
            _loc3_.rank = param2;
            _loc4_ = _loc5_.getTitle(Renamed2736.Renamed695(param1));
            if(_loc4_ != null)
            {
               _loc4_.setRank(param2);
            }
         }
      }
      
      private function Renamed2738(param1:String) : Renamed2407
      {
         var _loc2_:ClientObject = Renamed2736.Renamed695(param1);
         if(_loc2_ != null)
         {
            return Renamed2407(OSGi.getInstance().getService(Renamed2408));
         }
         return null;
      }
   }
}

