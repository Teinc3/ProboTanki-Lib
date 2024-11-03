package Renamed1583
{
   import Renamed1614.Renamed1615;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed4757 implements Renamed1584
   {
      private var object:IGameObject;
      
      private var impl:Renamed1584;
      
      public function Renamed4757(param1:IGameObject, param2:Renamed1584)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2080() : Vector.<IGameObject>
      {
         var Renamed2142:Vector.<IGameObject> = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2080();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
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
      
      public function Renamed1594() : String
      {
         var Renamed2142:String = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed1594();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed1595() : int
      {
         var Renamed2142:int = 0;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed1595();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function getMaxRank() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getMaxRank();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getMinRank() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getMinRank();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getThemeName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getThemeName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function Renamed1596() : Renamed1615
      {
         var Renamed2142:Renamed1615 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed1596();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed1597() : Vector.<Renamed1587>
      {
         var Renamed2142:Vector.<Renamed1587> = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed1597();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function isEnabled() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isEnabled();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getAdditionalCrystalsPercent() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getAdditionalCrystalsPercent();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPreviewResource() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getPreviewResource();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

