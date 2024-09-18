package §finally for continue§
{
   import §7"j§.§include finally§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §<!e§ implements §5$!§
   {
      private var object:IGameObject;
      
      private var impl:§5$!§;
      
      public function §<!e§(param1:IGameObject, param2:§5$!§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §throw catch use§(param1:IGameObject, param2:Tank, param3:§include finally§) : void
      {
         var §for const break§:IGameObject = param1;
         var §!!u§:Tank = param2;
         var §`#o§:§include finally§ = param3;
         var §<#A§:IGameObject = §for const break§;
         var §class for implements§:Tank = §!!u§;
         var §,#@§:§include finally§ = §`#o§;
         try
         {
            Model.object = this.object;
            this.impl.§throw catch use§(§<#A§,§class for implements§,§,#@§);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

