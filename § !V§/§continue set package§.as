package § !V§
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §continue set package§ implements §=p§
   {
      private var object:IGameObject;
      
      private var impl:§=p§;
      
      public function §continue set package§(param1:IGameObject, param2:§=p§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §include package var§(param1:ClientObject, param2:String) : Bonus
      {
         var §<#A§:ClientObject = param1;
         var §for const break§:String = param2;
         var §0!J§:Bonus = null;
         var §,!Y§:String = §for const break§;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§include package var§(§<#A§,§,!Y§);
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}

