package alternativa.tanks.service.battle
{
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleUserInfoService implements IBattleUserInfoService
   {
      [Inject]
      public static var logService:LogService;
      
      private var Renamed3623:Dictionary;
      
      public function BattleUserInfoService()
      {
         this.Renamed3623 = new Dictionary();
         super();
      }
      
      public function Renamed3624(param1:String) : Boolean
      {
         return param1 in this.Renamed3623;
      }
      
      public function Renamed3625(param1:String) : IGameObject
      {
         return this.Renamed3623[param1];
      }
      
      public function connect(param1:String, param2:IGameObject) : void
      {
         this.Renamed3623[param1] = param2;
      }
      
      public function disconnect(param1:String) : void
      {
         delete this.Renamed3623[param1];
      }
      
      public function Renamed2129(param1:IGameObject) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:String = null;
         for(_loc2_ in this.Renamed3623)
         {
            _loc3_ = this.Renamed3623[_loc2_];
            if(_loc3_ == param1)
            {
               this.disconnect(_loc2_);
            }
         }
      }
   }
}

