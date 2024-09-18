package §finally for continue§
{
   import §7"j§.§include finally§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §&#z§ implements §5$!§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§5$!§>;
      
      public function §&#z§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§5$!§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §throw catch use§(param1:IGameObject, param2:Tank, param3:§include finally§) : void
      {
         var §for const break§:IGameObject = param1;
         var §!!u§:Tank = param2;
         var §`#o§:§include finally§ = param3;
         var §final package§:int = 0;
         var §finally const catch§:§5$!§ = null;
         var §<#A§:IGameObject = §for const break§;
         var §class for implements§:Tank = §!!u§;
         var §,#@§:§include finally§ = §`#o§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§throw catch use§(§<#A§,§class for implements§,§,#@§);
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

