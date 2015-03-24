package rms.com.cmn.vo;

public class AuthVO
{
   /** 권한ID(PK) */
   private String auth_id;
   /** 권한명 */
   private String auth_name;
   /** 권한설명 */
   private String auth_description;
   private String writer;
   private String write_date;
   private String modifier;
   private String modify_date;
   /** 버전 */
   private String version;
   /** 활성여부 */
   private String enable_tf;

   public String getEnable_tf()
   {
      return enable_tf;
   }

   public void setEnable_tf(String enable_tf)
   {
      this.enable_tf = enable_tf;
   }

   /** 권한ID(PK) */
   public String getAuth_id()
   {
      return auth_id;
   }

   /** 권한ID(PK) */
   public void setAuth_id(String auth_id)
   {
      this.auth_id = auth_id;
   }

   /** 권한명 */
   public String getAuth_name()
   {
      return auth_name;
   }

   /** 권한명 */
   public void setAuth_name(String auth_name)
   {
      this.auth_name = auth_name;
   }

   /** 권한설명 */
   public String getAuth_description()
   {
      return auth_description;
   }

   /** 권한설명 */
   public void setAuth_description(String auth_description)
   {
      this.auth_description = auth_description;
   }

   public String getWriter()
   {
      return writer;
   }

   public void setWriter(String writer)
   {
      this.writer = writer;
   }

   public String getWrite_date()
   {
      return write_date;
   }

   public void setWrite_date(String write_date)
   {
      this.write_date = write_date;
   }

   public String getModifier()
   {
      return modifier;
   }

   public void setModifier(String modifier)
   {
      this.modifier = modifier;
   }

   public String getModify_date()
   {
      return modify_date;
   }

   public void setModify_date(String modify_date)
   {
      this.modify_date = modify_date;
   }

   public String getVersion()
   {
      return version;
   }

   public void setVersion(String version)
   {
      this.version = version;
   }

}
