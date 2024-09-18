package §function set dynamic§
{
   import §>#m§.§5!"§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §3!`§ implements §""'§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§""'§>;
      
      public function §3!`§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§""'§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function skipDailyQuest(param1:§5!"§) : void
      {
         var i:int = 0;
         var m:§""'§ = null;
         var dailyQuestInfo:§5!"§ = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.skipDailyQuest(dailyQuestInfo);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function takePrize(param1:§5!"§) : void
      {
         var i:int = 0;
         var m:§""'§ = null;
         var dailyQuestInfo:§5!"§ = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.takePrize(dailyQuestInfo);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

