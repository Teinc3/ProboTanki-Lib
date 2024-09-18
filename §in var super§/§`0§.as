package §in var super§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import §each throw§.§super set var§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §`0§ implements §9!T§
   {
      private var object:IGameObject;
      
      private var impl:§9!T§;
      
      public function §`0§(param1:IGameObject, param2:§9!T§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §-!<§(param1:ClientObject, param2:Vector3, param3:Vector.<§super set var§>) : void
      {
         var §for const break§:ClientObject = param1;
         var §!!u§:Vector3 = param2;
         var §`#o§:Vector.<§super set var§> = param3;
         var §use package in§:ClientObject = §for const break§;
         var §switch const false§:Vector3 = §!!u§;
         var §case var else§:Vector.<§super set var§> = §`#o§;
         try
         {
            Model.object = this.object;
            this.impl.§-!<§(§use package in§,§switch const false§,§case var else§);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

