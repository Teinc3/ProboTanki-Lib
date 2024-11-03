package Renamed142
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4538 implements Renamed2741
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2741>;
      
      public function Renamed4538(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2741>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2941(param1:int, param2:int, param3:Boolean) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:int = param2;
         var Renamed4951:Boolean = param3;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2741 = null;
         var Renamed4952:int = Renamed3693;
         var Renamed2987:int = Renamed4950;
         var Renamed4953:Boolean = Renamed4951;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed2941(Renamed4952,Renamed2987,Renamed4953);
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed4954(param1:int, param2:Boolean) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Boolean = param2;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2741 = null;
         var Renamed2987:int = Renamed3693;
         var Renamed4953:Boolean = Renamed4950;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed4954(Renamed2987,Renamed4953);
               Renamed2143++;
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

