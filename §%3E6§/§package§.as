package §>6§
{
   import §?"a§.§finally for do§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.§final package import§;
   
   public class §package§ implements §null for do§
   {
      private var object:IGameObject;
      
      private var impl:§null for do§;
      
      public function §package§(param1:IGameObject, param2:§null for do§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §throw package try§() : Vector.<IGameObject>
      {
         var §0!J§:Vector.<IGameObject> = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§throw package try§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
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
      
      public function §try var dynamic§() : String
      {
         var §0!J§:String = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§try var dynamic§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
      
      public function §get var case§() : int
      {
         var §0!J§:int = 0;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§get var case§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
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
      
      public function §0"E§() : §finally for do§
      {
         var §0!J§:§finally for do§ = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§0"E§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
      
      public function §=>§() : Vector.<§final package import§>
      {
         var §0!J§:Vector.<§final package import§> = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§=>§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
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

