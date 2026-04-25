package icarte.armedialab.com.icarte;

import icarte.armedialab.com.icarte.util.Utils.ErrorCode;

/**
 * Created by Maqsood on 5/22/2017.
 */
public class BaseException extends RuntimeException {
    private ErrorCode errorCode;

    public BaseException(ErrorCode errorCode) {
        super();
        this.errorCode = errorCode;
    }

    public BaseException(String detailMessage, ErrorCode errorCode) {
        super(detailMessage);
        this.errorCode = errorCode;
    }

    public BaseException(String detailMessage, ErrorCode errorCode, Throwable throwable) {
        super(detailMessage, throwable);
        this.errorCode = errorCode;
    }

    public BaseException(ErrorCode errorCode, Throwable throwable) {
        super(throwable);
        this.errorCode = errorCode;
    }

    public ErrorCode getErrorCode() {
        return errorCode;
    }
}
