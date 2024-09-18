package §>6§
{
   import §?"a§.§finally for do§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.§final package import§;
   
   public class §`!f§ implements §null for do§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§null for do§>;
      
      public function §`!f§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§null for do§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §throw package try§() : Vector.<IGameObject>
      {
         var §0!J§:Vector.<IGameObject> = null;
         var §final package§:int = 0;
         var §finally const catch§:§null for do§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§throw package try§();
               §final package§++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
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
      
      public function §try var dynamic§() : String
      {
         var §0!J§:String = null;
         var §final package§:int = 0;
         var §finally const catch§:§null for do§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§try var dynamic§();
               §final package§++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:§null for do§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§get var case§();
               §final package§++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMaxRank();
               i++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMinRank();
               i++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getThemeName();
               i++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:§null for do§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§0"E§();
               §final package§++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:§null for do§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§=>§();
               §final package§++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isEnabled();
               i++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getAdditionalCrystalsPercent();
               i++;
            }
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
         var i:int = 0;
         var m:§null for do§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPreviewResource();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

