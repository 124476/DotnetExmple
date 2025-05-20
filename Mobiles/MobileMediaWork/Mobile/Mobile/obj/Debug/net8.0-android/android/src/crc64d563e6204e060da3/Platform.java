package crc64d563e6204e060da3;


public class Platform
	extends androidx.fragment.app.Fragment
	implements
		mono.android.IGCUserPeer,
		androidx.activity.result.ActivityResultCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onActivityResult:(Ljava/lang/Object;)V:GetOnActivityResult_Ljava_lang_Object_Handler:AndroidX.Activity.Result.IActivityResultCallbackInvoker, Xamarin.AndroidX.Activity\n" +
			"";
		mono.android.Runtime.register ("ImageCropper.Maui.Platform, ImageCropper.Maui", Platform.class, __md_methods);
	}


	public Platform ()
	{
		super ();
		if (getClass () == Platform.class) {
			mono.android.TypeManager.Activate ("ImageCropper.Maui.Platform, ImageCropper.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public Platform (int p0)
	{
		super (p0);
		if (getClass () == Platform.class) {
			mono.android.TypeManager.Activate ("ImageCropper.Maui.Platform, ImageCropper.Maui", "System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0 });
		}
	}


	public void onActivityResult (java.lang.Object p0)
	{
		n_onActivityResult (p0);
	}

	private native void n_onActivityResult (java.lang.Object p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
