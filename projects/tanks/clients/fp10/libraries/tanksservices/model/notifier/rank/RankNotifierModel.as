package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank
{
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.rank.Renamed4399;
   import projects.tanks.client.tanksservices.model.notifier.rank.Renamed4401;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   
   public class RankNotifierModel extends Renamed4399 implements Renamed4401, UserRefresh
   {
      private var data:Dictionary;
      
      public function RankNotifierModel()
      {
         this.data = new Dictionary();
         super();
      }
      
      public function setRank(param1:Vector.<RankNotifierData>) : void
      {
         var _loc2_:RankNotifierData = null;
         for each(_loc2_ in param1)
         {
            this.setAndUpdateConsumer(_loc2_);
         }
      }
      
      public function setAndUpdateConsumer(param1:RankNotifierData) : void
      {
         var _loc2_:UserInfoConsumer = null;
         var _loc3_:String = param1.userId;
         this.data[_loc3_] = param1.rank;
         var _loc4_:UserNotifier = UserNotifier(modelRegistry.getModel(Long.getLong(0,300150005)));
         if(_loc4_.hasDataConsumer(_loc3_))
         {
            _loc2_ = _loc4_.getDataConsumer(_loc3_);
            _loc2_.setRank(param1.rank);
         }
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         if(param1 in this.data)
         {
            param2.setRank(this.data[param1]);
         }
      }
      
      public function remove(param1:String) : void
      {
         delete this.data[param1];
      }
   }
}

