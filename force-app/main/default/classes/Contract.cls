/**
 * Implementation of a Code Contract, allowing the definition of pre, post and invariant conditions.
 *
 * @group Utils
 */
public class Contract
{
	public class RequiresException extends Exception {}

	/**
	 * Defines that the given condition must be true, otherwise an exception is thrown.
	 *
	 * Is used for defining Contractual pre-conditions in methods.
	 *
	 * @param	Boolean	The condition that must be true
	 * @param	String	The message to emit when the condition is not true
	 */
	public static void requires( Boolean condition, String message )
	{
		if ( !condition )
		{
			throw new RequiresException( 'Contract.requires failed: ' + message );
		}
	}

}