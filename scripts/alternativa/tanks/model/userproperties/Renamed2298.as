package alternativa.tanks.model.userproperties
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed2298 implements IUserProperties
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IUserProperties>;
      
      public function Renamed2298(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IUserProperties>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getId() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getId();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getName() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getName();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getScore() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getScore();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getRank() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getRank();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getNextScore() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getNextScore();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPlace() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPlace();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getHasDoubleCrystal() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IUserProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getHasDoubleCrystal();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setHasDoubleCrystal(param1:Boolean) : void
      {
         var i:int = 0;
         var m:IUserProperties = null;
         var value:Boolean = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.setHasDoubleCrystal(value);
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

