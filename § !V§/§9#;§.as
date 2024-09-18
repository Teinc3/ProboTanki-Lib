package § !V§
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §9#;§ implements §=p§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§=p§>;
      
      public function §9#;§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§=p§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §include package var§(param1:ClientObject, param2:String) : Bonus
      {
         var §<#A§:ClientObject = param1;
         var §for const break§:String = param2;
         var §0!J§:Bonus = null;
         var §final package§:int = 0;
         var §finally const catch§:§=p§ = null;
         var §,!Y§:String = §for const break§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§include package var§(§<#A§,§,!Y§);
               §final package§++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}

