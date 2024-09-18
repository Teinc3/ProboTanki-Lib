package §in var super§
{
   import alternativa.math.Vector3;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   
   public class §each package for§ implements §implements const use§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§implements const use§>;
      
      public function §each package for§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§implements const use§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §;# §(param1:int, param2:Vector3, param3:Vector.<§default for break§>) : void
      {
         var §for const break§:int = param1;
         var §!!u§:Vector3 = param2;
         var §`#o§:Vector.<§default for break§> = param3;
         var §final package§:int = 0;
         var §finally const catch§:§implements const use§ = null;
         var §-#`§:int = §for const break§;
         var §switch const false§:Vector3 = §!!u§;
         var §case var else§:Vector.<§default for break§> = §`#o§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§;# §(§-#`§,§switch const false§,§case var else§);
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §case break§(param1:int, param2:Vector3) : void
      {
         var §for const break§:int = param1;
         var §!!u§:Vector3 = param2;
         var §final package§:int = 0;
         var §finally const catch§:§implements const use§ = null;
         var §-#`§:int = §for const break§;
         var §switch const false§:Vector3 = §!!u§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§case break§(§-#`§,§switch const false§);
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

