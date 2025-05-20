package mono.com.canhub.cropper;


public class CropImageView_OnSetImageUriCompleteListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.canhub.cropper.CropImageView.OnSetImageUriCompleteListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onSetImageUriComplete:(Lcom/canhub/cropper/CropImageView;Landroid/net/Uri;Ljava/lang/Exception;)V:GetOnSetImageUriComplete_Lcom_canhub_cropper_CropImageView_Landroid_net_Uri_Ljava_lang_Exception_Handler:Com.Canhub.Cropper.CropImageView/IOnSetImageUriCompleteListenerInvoker, Com.Vanniktech.AndroidImageCropper.Maui\n" +
			"";
		mono.android.Runtime.register ("Com.Canhub.Cropper.CropImageView+IOnSetImageUriCompleteListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", CropImageView_OnSetImageUriCompleteListenerImplementor.class, __md_methods);
	}


	public CropImageView_OnSetImageUriCompleteListenerImplementor ()
	{
		super ();
		if (getClass () == CropImageView_OnSetImageUriCompleteListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Canhub.Cropper.CropImageView+IOnSetImageUriCompleteListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public void onSetImageUriComplete (com.canhub.cropper.CropImageView p0, android.net.Uri p1, java.lang.Exception p2)
	{
		n_onSetImageUriComplete (p0, p1, p2);
	}

	private native void n_onSetImageUriComplete (com.canhub.cropper.CropImageView p0, android.net.Uri p1, java.lang.Exception p2);

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
