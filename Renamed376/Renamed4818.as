package Renamed376
{
   import Renamed4808.Renamed5536;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4818 implements Renamed4817
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4817>;
      
      public function Renamed4818(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4817>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function skipDailyQuest(param1:Renamed5536) : void
      {
         var i:int = 0;
         var m:Renamed4817 = null;
         var dailyQuestInfo:Renamed5536 = param1;
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
      
      public function takePrize(param1:Renamed5536) : void
      {
         var i:int = 0;
         var m:Renamed4817 = null;
         var dailyQuestInfo:Renamed5536 = param1;
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

