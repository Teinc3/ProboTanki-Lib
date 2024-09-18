package Renamed485
{
   import Renamed142.Renamed2741;
   import Renamed207.Renamed6145;
   import Renamed207.Renamed4572;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   
   public class Renamed4641 extends Renamed6145 implements Renamed4572, Renamed4640
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed9588:Renamed4642;
      
      private var Renamed9589:Dictionary;
      
      private var Renamed2433:Renamed2407;
      
      public function Renamed4641()
      {
         this.Renamed9589 = new Dictionary();
         super();
      }
      
      public function initObject(param1:ClientObject, param2:Long, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc9_:IModelService = null;
         if(this.Renamed9588 == null)
         {
            _loc9_ = IModelService(OSGi.getInstance().getService(IModelService));
            this.Renamed9588 = Renamed4642(modelRegistry.getModelsByInterface(Renamed4642)[0]);
            this.Renamed2433 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         }
         var _loc7_:Renamed9565 = new Renamed9565(param1,param5,param3,(param6 + param4) * 1000);
         this.Renamed9589[param1] = _loc7_;
         var _loc8_:int = param5 - 1;
         this.Renamed9588.Renamed9570(_loc7_,_loc8_);
      }
      
      [Obfuscation(rename="false")]
      public function activated(param1:ClientObject, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:Renamed9565 = this.Renamed9589[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.Renamed9586(param2);
         if(param3)
         {
            --_loc4_.count;
         }
         this.Renamed9588.Renamed9574(_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function updateCount(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed9565 = this.Renamed9589[param1];
         if(_loc3_ != null)
         {
            if(_loc3_.count <= 0 && param2 > 0)
            {
               Renamed4639(modelRegistry.getModelsByInterface(Renamed2741)[0]).initItemSlot(_loc3_);
            }
            _loc3_.count = param2;
            Renamed4639(modelRegistry.getModelsByInterface(Renamed2741)[0]).itemUpdateCount(_loc3_);
         }
      }
      
      public function Renamed9581(param1:Renamed9565) : void
      {
         if(param1.Renamed9587())
         {
            this.activate(param1.Renamed9584());
         }
      }
      
      private function activate(param1:ClientObject) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.activate(param1.id);
      }
   }
}

