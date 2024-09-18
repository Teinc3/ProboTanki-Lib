package §]i§
{
   import §!!v§.§use catch true§;
   import §,#K§.§^4§;
   import §,#K§.§null for static§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   
   public class §const const false§ extends §^4§ implements §null for static§, §2#_§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var §6'§:§dynamic var while§;
      
      private var §override for if§:Dictionary;
      
      private var §continue package const§:§2!s§;
      
      public function §const const false§()
      {
         this.§override for if§ = new Dictionary();
         super();
      }
      
      public function initObject(param1:ClientObject, param2:Long, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc9_:IModelService = null;
         if(this.§6'§ == null)
         {
            _loc9_ = IModelService(OSGi.getInstance().getService(IModelService));
            this.§6'§ = §dynamic var while§(modelRegistry.getModelsByInterface(§dynamic var while§)[0]);
            this.§continue package const§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         }
         var _loc7_:§1!;§ = new §1!;§(param1,param5,param3,(param6 + param4) * 1000);
         this.§override for if§[param1] = _loc7_;
         var _loc8_:int = param5 - 1;
         this.§6'§.§function try§(_loc7_,_loc8_);
      }
      
      [Obfuscation(rename="false")]
      public function activated(param1:ClientObject, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:§1!;§ = this.§override for if§[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.§in catch finally§(param2);
         if(param3)
         {
            --_loc4_.count;
         }
         this.§6'§.§<r§(_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function updateCount(param1:ClientObject, param2:int) : void
      {
         var _loc3_:§1!;§ = this.§override for if§[param1];
         if(_loc3_ != null)
         {
            if(_loc3_.count <= 0 && param2 > 0)
            {
               §'#;§(modelRegistry.getModelsByInterface(§use catch true§)[0]).initItemSlot(_loc3_);
            }
            _loc3_.count = param2;
            §'#;§(modelRegistry.getModelsByInterface(§use catch true§)[0]).itemUpdateCount(_loc3_);
         }
      }
      
      public function §try for do§(param1:§1!;§) : void
      {
         if(param1.§dynamic set true§())
         {
            this.activate(param1.§4#K§());
         }
      }
      
      private function activate(param1:ClientObject) : void
      {
         battleEventDispatcher.dispatchEvent(§##a§.§const for use§);
         server.activate(param1.id);
      }
   }
}

