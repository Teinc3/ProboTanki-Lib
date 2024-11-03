package alternativa.tanks.model.userproperties
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed2299 implements IUserProperties
   {
      private var object:IGameObject;
      
      private var impl:IUserProperties;
      
      public function Renamed2299(param1:IGameObject, param2:IUserProperties)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getId() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getId();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getName();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getScore();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getRank();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getNextScore();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getPlace();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getHasDoubleCrystal();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setHasDoubleCrystal(param1:Boolean) : void
      {
         var value:Boolean = param1;
         try
         {
            Model.object = this.object;
            this.impl.setHasDoubleCrystal(value);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

