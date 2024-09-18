package §in var super§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import §each throw§.§super set var§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §finally package with§ implements §9!T§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§9!T§>;
      
      public function §finally package with§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§9!T§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §-!<§(param1:ClientObject, param2:Vector3, param3:Vector.<§super set var§>) : void
      {
         var §for const break§:ClientObject = param1;
         var §!!u§:Vector3 = param2;
         var §`#o§:Vector.<§super set var§> = param3;
         var §final package§:int = 0;
         var §finally const catch§:§9!T§ = null;
         var §use package in§:ClientObject = §for const break§;
         var §switch const false§:Vector3 = §!!u§;
         var §case var else§:Vector.<§super set var§> = §`#o§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§-!<§(§use package in§,§switch const false§,§case var else§);
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

