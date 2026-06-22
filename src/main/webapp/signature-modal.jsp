<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* Dinh dang cho vung nen mo o phia sau */
    .modal-overlay {
        display: none;
        position: fixed;
        top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.6);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

    /* Dinh dang cho khung noi dung popup chinh */
    .modal-content {
        background: #ffffff;
        width: 420px;
        max-width: 90%;
        border-radius: 10px;
        padding: 18px 22px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.3);
        position: relative;
        animation: animateslide 0.3s ease-out;
        max-height: 90vh;
        overflow-y: auto;
    }

    @keyframes animateslide {
        from { transform: translateY(-50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    /* Dinh dang cho nut dong popup */
    .close-btn {
        position: absolute;
        top: 15px; right: 20px;
        font-size: 28px;
        cursor: pointer;
        color: #a4b0be;
        transition: 0.2s;
    }
    .close-btn:hover { color: #2f3542; }

    /* Dinh dang cho tieu de cua popup */
    .modal-title {
        margin-top: 0;
        color: #2f3542;
        font-size: 16px;
        border-bottom: 2px solid #f1f2f6;
        padding-bottom: 8px;
        margin-bottom: 12px;
    }

    /* Dinh dang cho cac khoi tung buoc ben trong */
    .step-group {
        margin-bottom: 10px;
        padding: 10px;
        background: #f8f9fa;
        border-radius: 6px;
        border: 1px solid #dfe4ea;
    }
    .step-title {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
        color: #3742fa;
        font-size: 12px;
    }

    /* Dinh dang cho cac o nhap lieu va the lua chon */
    .modal-content textarea,
    .modal-content input[type="text"],
    .modal-content select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced6e0;
        border-radius: 6px;
        box-sizing: border-box;
        font-family: monospace;
        font-size: 13px;
    }
    .modal-content textarea { resize: none; height: 50px; background: #fffaf0; }
    .hash-result { background: #f1f9f5; color: #2ed573; font-weight: bold; }

    /* Dinh dang cho vung keo tha hoac chon file */
    .file-drop-area {
        border: 2px solid #70a1ff;
        border-radius: 6px;
        padding: 10px;
        text-align: center;
        background: #ffffff;
        cursor: pointer;
        transition: 0.3s;
        font-size: 12px;
    }
    .file-drop-area:hover { background: #f1f2f6; border-color: #3742fa; }
    .file-drop-area input { display: none; }

    /* Dinh dang cho nut bam thuc thi chinh */
    .btn-action {
        width: 100%;
        padding: 10px;
        background-color: #2ed573;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.2s;
        box-shadow: 0 4px 6px rgba(46, 213, 115, 0.2);
    }
    .btn-action:hover { background-color: #26de81; }

    /* Dinh dang cho dong chu thong bao trang thai thanh cong */
    .sig-read-success { color: #2ed573; font-size: 13px; margin-top: 8px; display: none; font-weight: 500; }
</style>

<div class="modal-overlay" id="signatureToolModal">
    <div class="modal-content">
        <span class="close-btn" id="btnCloseSigModal">x</span>
        <h3 class="modal-title">Xác Thực Đơn Hàng Bằng Chữ Ký Điện Tử</h3>

        <div class="step-group">
            <span class="step-title">Thông tin đơn hàng gốc</span>
            <textarea id="orderDataString" readonly placeholder="Hệ thống đang chuẩn bị chuỗi đơn hàng">${sessionScope.orderDataString}</textarea>
        </div>

        <div class="step-group">
            <span class="step-title">Thuật toán Ký & Cơ chế Padding (CA Server)</span>
            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
                <select id="cryptoAlgorithm" style="flex: 1;" disabled>
                    <option value="RSA">Chữ ký RSA (SHA-256)</option>
                </select>
                <select id="paddingAlgorithm" style="flex: 1;">
                    <option value="PSS">Padding: RSASSA-PSS (Khuyên dùng)</option>
                    <option value="PKCS1">Padding: PKCS#1 v1.5</option>
                </select>
            </div>
        </div>

        <div class="step-group">
            <span class="step-title">Tải file Private Key và Public Key</span>
            <div class="file-drop-area" id="keyFileArea" style="margin-bottom: 10px;">
                <span id="keyFileText">Nhấp vào đây để chọn file private key</span>
                <input type="file" id="inputPrivateKeyFile" accept=".txt,.pem,.key">
            </div>
            <div id="keyReadSuccess" class="sig-read-success">Đã đọc thành công Private key</div>
            
            <div class="file-drop-area" id="pubKeyFileArea">
                <span id="pubKeyFileText">Nhấp vào đây để chọn file public key (BẮT BUỘC)</span>
                <input type="file" id="inputPublicKeyFile" accept=".txt,.pem,.key,.pub">
            </div>
            <div id="pubKeyReadSuccess" class="sig-read-success">Đã đọc thành công Public key</div>
        </div>

        <button class="btn-action" id="btnSubmitSignature">Ký VÀ HOÀN TẤT THANH TOÁN</button>
    </div>
</div>

<script>
    /* Javascript co ban de dong mo giao dien popup */
    const sigModal = document.getElementById('signatureToolModal');
    const btnCloseSig = document.getElementById('btnCloseSigModal');

    function openSignatureTool() {
        // Tự động gom dữ liệu từ form thanh toán (nếu có) để tạo chuỗi dữ liệu gốc
        let form = null;
        for (let f of document.forms) {
            if (f.action && f.action.includes('xac-nhan-thanh-toan')) {
                form = f;
                break;
            }
        }
        if (!form && document.forms.length > 1) {
            form = document.forms[1];
        }

        if (form) {
            // Kiểm tra các trường bắt buộc của HTML5
            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }

            // Xác thực thông tin khách hàng trùng khớp với tài khoản (Mô phỏng logic backend)
            let ho = form.elements['ho'] ? form.elements['ho'].value.trim() : '';
            let ten = form.elements['name'] ? form.elements['name'].value.trim() : '';
            let email = form.elements['email'] ? form.elements['email'].value.trim() : '';
            let phone = form.elements['phone'] ? form.elements['phone'].value.trim() : '';

            let sessionFullName = '${sessionScope.khachHang.fullName}'.trim().toLowerCase();
            let sessionEmail = '${sessionScope.khachHang.email}'.trim().toLowerCase();
            let sessionPhone = '${sessionScope.khachHang.phoneNumber}'.trim();

            let inputFullName = (ho + " " + ten).trim().toLowerCase();

            let errors = [];
            if (sessionFullName && inputFullName !== sessionFullName) {
                errors.push("Họ và tên bạn nhập không chính xác.");
            }
            if (sessionEmail && email.toLowerCase() !== sessionEmail) {
                errors.push("Email bạn nhập không chính xác.");
            }
            if (sessionPhone && phone !== sessionPhone) {
                errors.push("Số điện thoại bạn nhập không chính xác.");
            }

            if (errors.length > 0) {
                customAlert("Vui lòng kiểm tra lại thông tin:\n- " + errors.join("\n- "));
                return; // Ngừng, không mở popup ký
            }
        }

        // Mở popup nếu dữ liệu hợp lệ
        sigModal.style.display = 'flex';
        
        let currentData = document.getElementById('orderDataString').value.trim();
        
        if (!currentData && form) {
            let dataStr = "";
            const formData = new FormData(form);
            for (let [key, value] of formData.entries()) {
                if (key !== "digitalSignature" && value.trim() !== "") {
                    dataStr += key + ": " + value + "\n";
                }
            }
            document.getElementById('orderDataString').value = dataStr.trim();
        }
    }

    btnCloseSig.addEventListener('click', function() {
        sigModal.style.display = 'none';
    });

    window.addEventListener('click', function(e) {
        if (e.target === sigModal) {
            sigModal.style.display = 'none';
        }
    });

    const keyFileArea = document.getElementById('keyFileArea');
    const inputPrivateKeyFile = document.getElementById('inputPrivateKeyFile');
    const keyFileText = document.getElementById('keyFileText');
    const keyReadSuccess = document.getElementById('keyReadSuccess');
    
    const pubKeyFileArea = document.getElementById('pubKeyFileArea');
    const inputPublicKeyFile = document.getElementById('inputPublicKeyFile');
    const pubKeyFileText = document.getElementById('pubKeyFileText');
    const pubKeyReadSuccess = document.getElementById('pubKeyReadSuccess');
    
    let uploadedPrivateKeyContent = '';
    let uploadedPublicKeyContent = '';
    const currentOwnerSig = '${sessionScope.khachHang.userName}';

    keyFileArea.addEventListener('click', function() {
        inputPrivateKeyFile.click();
    });

    inputPrivateKeyFile.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            keyFileText.innerText = file.name;
            const reader = new FileReader();
            reader.onload = function(evt) {
                uploadedPrivateKeyContent = evt.target.result;
                keyReadSuccess.style.display = 'block';
            };
            reader.readAsText(file);
        }
    });

    pubKeyFileArea.addEventListener('click', function() {
        inputPublicKeyFile.click();
    });

    inputPublicKeyFile.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            pubKeyFileText.innerText = file.name;
            const reader = new FileReader();
            reader.onload = function(evt) {
                uploadedPublicKeyContent = evt.target.result;
                pubKeyReadSuccess.style.display = 'block';
            };
            reader.readAsText(file);
        }
    });

    const btnSubmitSignature = document.getElementById('btnSubmitSignature');
    btnSubmitSignature.innerText = 'KÝ ĐƠN HÀNG';
    
    btnSubmitSignature.addEventListener('click', async function() {
        if (!uploadedPrivateKeyContent || !uploadedPublicKeyContent) {
            customAlert('Vui lòng tải lên ĐẦY ĐỦ file Private Key và Public Key của bạn trước khi ký!');
            return;
        }

        const dataToSign = document.getElementById('orderDataString').value;
        const paddingAlg = document.getElementById('paddingAlgorithm').value;

        try {
            btnSubmitSignature.disabled = true;
            btnSubmitSignature.innerText = 'ĐANG KÝ...';

            // 1. Giả lập ký số
            const signRes = await fetch('${pageContext.request.contextPath}/ca-proxy/simulate-sign', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    data: dataToSign,
                    privateKey: uploadedPrivateKeyContent,
                    padding: paddingAlg
                })
            });

            if (!signRes.ok) {
                customAlert('Lỗi ký số: ' + await signRes.text());
                throw new Error('Sign error');
            }

            const signData = await signRes.json();
            const signature = signData.signature;

            // 2. Xác thực (Verify) qua proxy
            const verifyRes = await fetch('${pageContext.request.contextPath}/ca-proxy/verify', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    data: dataToSign,
                    signature: signature,
                    owner: currentOwnerSig,
                    padding: paddingAlg
                })
            });

            if (!verifyRes.ok) {
                customAlert('Lỗi khi gọi API xác thực: ' + await verifyRes.text());
                throw new Error('Verify API error');
            }

            const isValid = await verifyRes.json();
            
            if (isValid === true) {
                // 3. Gửi thông tin về backend để lưu db
                if(!window.currentSigningOrderID) {
                    customAlert('Lỗi: Không xác định được mã đơn hàng để ký!');
                    return;
                }
                
                const saveRes = await fetch('${pageContext.request.contextPath}/confirm-signature', {
                	method: 'POST',
                	headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                	body: new URLSearchParams({
                		orderID: window.currentSigningOrderID,
                		digitalSignature: signature,
                		publicKey: uploadedPublicKeyContent
                	})
                });
                if(saveRes.ok) {
                	customAlert('Ký và xác thực chữ ký thành công!');
                	location.reload(); // reload to show updated status
                } else {
                	customAlert('Lỗi lưu trữ chữ ký: ' + await saveRes.text());
                }
            } else {
                customAlert('Chữ ký không hợp lệ hoặc chứng chỉ đã bị thu hồi. Từ chối ký!');
            }
        } catch (e) {
            console.error(e);
        } finally {
            btnSubmitSignature.innerText = 'KÝ ĐƠN HÀNG';
            btnSubmitSignature.disabled = false;
        }
    });
</script>

<!-- Custom Alert Modal -->
<div id="customAlertOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.4); z-index: 10000; align-items: center; justify-content: center;">
    <div style="background: white; padding: 25px; border-radius: 8px; width: 350px; text-align: center; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
        <div id="customAlertMessage" style="margin-bottom: 25px; font-size: 16px; color: #333; line-height: 1.4; white-space: pre-wrap;"></div>
        <button onclick="document.getElementById('customAlertOverlay').style.display='none'" style="padding: 10px 25px; background: #3742fa; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 15px; font-weight: bold;">Đóng</button>
    </div>
</div>

<script>
    function customAlert(msg) {
        document.getElementById('customAlertMessage').innerText = msg;
        document.getElementById('customAlertOverlay').style.display = 'flex';
    }
</script>