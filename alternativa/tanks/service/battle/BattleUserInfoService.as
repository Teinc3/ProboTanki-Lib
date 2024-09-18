package alternativa.tanks.service.battle
{
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleUserInfoService implements IBattleUserInfoService
   {
      [Inject]
      public static var logService:LogService;
      
      private var §get catch use§:Dictionary;
      
      public function BattleUserInfoService()
      {
         this.§get catch use§ = new Dictionary();
         super();
      }
      
      public function §throw package native§(param1:String) : Boolean
      {
         return param1 in this.§get catch use§;
      }
      
      public function §1#Q§(param1:String) : IGameObject
      {
         return this.§get catch use§[param1];
      }
      
      public function connect(param1:String, param2:IGameObject) : void
      {
         this.§get catch use§[param1] = param2;
      }
      
      public function disconnect(param1:String) : void
      {
         delete this.§get catch use§[param1];
      }
      
      public function §try null§(param1:IGameObject) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:String = null;
         for(_loc2_ in this.§get catch use§)
         {
            _loc3_ = this.§get catch use§[_loc2_];
            if(_loc3_ == param1)
            {
               this.disconnect(_loc2_);
            }
         }
      }
   }
}

