package mono.com.canhub.cropper;


public class CropImageView_OnSetCropWindowChangeListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.canhub.cropper.CropImageView.OnSetCropWindowChangeListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCropWindowChanged:()V:GetOnCropWindowChangedHandler:Com.Canhub.Cropper.CropImageView/IOnSetCropWindowChangeListenerInvoker, Com.Vanniktech.AndroidImageCropper.Maui\n" +
			"";
		mono.android.Runtime.register ("Com.Canhub.Cropper.CropImageView+IOnSetCropWindowChangeListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", CropImageView_OnSetCropWindowChangeListenerImplementor.class, __md_methods);
	}


	public CropImageView_OnSetCropWindowChangeListenerImplementor ()
	{
		super ();
		if (getClass () == CropImageView_OnSetCropWindowChangeListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Canhub.Cropper.CropImageView+IOnSetCropWindowChangeListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public void onCropWindowChanged ()
	{
		n_onCropWindowChanged ();
	}

	private native void n_onCropWindowChanged ();

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
