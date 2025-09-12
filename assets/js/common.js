// Common JavaScript functions for ERP System

// Toggle password visibility
function togglePasswordVisibility(passwordFieldId, toggleButtonId) {
    const password = document.getElementById(passwordFieldId);
    const icon = document.querySelector(`#${toggleButtonId} i`);
    
    if (password.type === 'password') {
        password.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        password.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

// Demo login function
function demoLogin(role) {
    const credentials = {
        admin: { email: 'admin@college.edu', password: 'admin123' },
        student: { email: 'student@college.edu', password: 'student123' },
        faculty: { email: 'faculty@college.edu', password: 'faculty123' }
    };
    
    if (document.getElementById(role)) {
        document.getElementById(role).checked = true;
    }
    
    if (document.getElementById('email')) {
        document.getElementById('email').value = credentials[role].email;
    }
    
    if (document.getElementById('password')) {
        document.getElementById('password').value = credentials[role].password;
    }
    
    setTimeout(() => {
        redirectToDashboard(role);
    }, 500);
}

// Function to redirect to role-specific dashboard
function redirectToDashboard(role) {
    const dashboardUrls = {
        admin: 'pages/admin/dashboard.html',
        student: 'pages/student/dashboard.html',
        faculty: 'pages/faculty/dashboard.html'
    };
    
    const dashboardUrl = dashboardUrls[role] || 'pages/admin/dashboard.html';
    window.location.href = dashboardUrl + '?role=' + role;
}

// Format date function
function formatDate(date) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(date).toLocaleDateString('en-US', options);
}

// Format time function
function formatTime(time) {
    return new Date(`2000-01-01 ${time}`).toLocaleTimeString('en-US', {
        hour: 'numeric',
        minute: '2-digit',
        hour12: true
    });
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    notification.style.top = '20px';
    notification.style.right = '20px';
    notification.style.zIndex = '9999';
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 5000);
}

// Filter table rows
function filterTable(tableId, filterValue, columnIndex) {
    const table = document.getElementById(tableId);
    const rows = table.getElementsByTagName('tr');
    
    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].getElementsByTagName('td');
        if (cells.length > columnIndex) {
            const cellText = cells[columnIndex].textContent || cells[columnIndex].innerText;
            if (filterValue === '' || cellText.toLowerCase().indexOf(filterValue.toLowerCase()) > -1) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }
}

// Initialize tooltips
function initializeTooltips() {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
}

// Mobile sidebar functionality
function initializeMobileSidebar() {
    const sidebar = document.querySelector('.sidebar');
    const overlay = document.querySelector('.sidebar-overlay');
    const toggleBtn = document.querySelector('.mobile-nav-toggle');
    
    if (!sidebar || !toggleBtn) return;
    
    // Create overlay if it doesn't exist
    if (!overlay) {
        const newOverlay = document.createElement('div');
        newOverlay.className = 'sidebar-overlay';
        document.body.appendChild(newOverlay);
    }
    
    // Toggle sidebar
    toggleBtn.addEventListener('click', function() {
        sidebar.classList.toggle('show');
        document.querySelector('.sidebar-overlay').classList.toggle('show');
        document.body.style.overflow = sidebar.classList.contains('show') ? 'hidden' : '';
    });
    
    // Close sidebar when clicking overlay
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('sidebar-overlay')) {
            sidebar.classList.remove('show');
            document.querySelector('.sidebar-overlay').classList.remove('show');
            document.body.style.overflow = '';
        }
    });
    
    // Close sidebar when clicking a nav link on mobile
    if (window.innerWidth < 768) {
        const navLinks = sidebar.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                sidebar.classList.remove('show');
                document.querySelector('.sidebar-overlay').classList.remove('show');
                document.body.style.overflow = '';
            });
        });
    }
}

// Mobile table to card conversion
function initializeMobileTableCards() {
    if (window.innerWidth >= 768) return;
    
    const tables = document.querySelectorAll('.table-responsive-mobile table');
    
    tables.forEach(table => {
        const headers = Array.from(table.querySelectorAll('thead th')).map(th => th.textContent.trim());
        const rows = table.querySelectorAll('tbody tr');
        
        const cardContainer = document.createElement('div');
        cardContainer.className = 'mobile-table-cards d-md-none';
        
        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const card = document.createElement('div');
            card.className = 'table-card-mobile';
            
            let cardHTML = '<div class="card-body">';
            
            cells.forEach((cell, index) => {
                if (index < headers.length) {
                    cardHTML += `
                        <div class="info-row">
                            <span class="info-label">${headers[index]}:</span>
                            <span class="info-value">${cell.innerHTML}</span>
                        </div>
                    `;
                }
            });
            
            cardHTML += '</div>';
            card.innerHTML = cardHTML;
            cardContainer.appendChild(card);
        });
        
        table.parentNode.appendChild(cardContainer);
        table.parentNode.classList.add('d-none', 'd-md-block');
    });
}

// Touch gesture support
function initializeTouchGestures() {
    let startX = 0;
    let startY = 0;
    
    document.addEventListener('touchstart', function(e) {
        startX = e.touches[0].clientX;
        startY = e.touches[0].clientY;
    });
    
    document.addEventListener('touchend', function(e) {
        if (!startX || !startY) return;
        
        const endX = e.changedTouches[0].clientX;
        const endY = e.changedTouches[0].clientY;
        
        const diffX = startX - endX;
        const diffY = startY - endY;
        
        // Swipe right to open sidebar (on mobile)
        if (Math.abs(diffX) > Math.abs(diffY) && diffX < -50 && startX < 50 && window.innerWidth < 768) {
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.querySelector('.sidebar-overlay');
            if (sidebar && !sidebar.classList.contains('show')) {
                sidebar.classList.add('show');
                overlay.classList.add('show');
                document.body.style.overflow = 'hidden';
            }
        }
        
        // Swipe left to close sidebar
        if (Math.abs(diffX) > Math.abs(diffY) && diffX > 50 && window.innerWidth < 768) {
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.querySelector('.sidebar-overlay');
            if (sidebar && sidebar.classList.contains('show')) {
                sidebar.classList.remove('show');
                overlay.classList.remove('show');
                document.body.style.overflow = '';
            }
        }
        
        startX = 0;
        startY = 0;
    });
}

// Responsive chart resizing
function initializeResponsiveCharts() {
    window.addEventListener('resize', function() {
        // Trigger chart resize if Chart.js is loaded
        if (typeof Chart !== 'undefined') {
            Chart.helpers.each(Chart.instances, function(instance) {
                instance.resize();
            });
        }
    });
}

// Mobile form enhancements
function initializeMobileFormEnhancements() {
    // Auto-format phone numbers
    const phoneInputs = document.querySelectorAll('input[type="tel"]');
    phoneInputs.forEach(input => {
        input.addEventListener('input', function() {
            // Basic phone number formatting
            let value = this.value.replace(/\D/g, '');
            if (value.length >= 6) {
                value = value.replace(/(\d{3})(\d{3})(\d{0,4})/, '($1) $2-$3');
            } else if (value.length >= 3) {
                value = value.replace(/(\d{3})(\d{0,3})/, '($1) $2');
            }
            this.value = value;
        });
    });
    
    // Prevent zoom on iOS when focusing inputs
    if (/iPad|iPhone|iPod/.test(navigator.userAgent)) {
        const inputs = document.querySelectorAll('input, select, textarea');
        inputs.forEach(input => {
            if (input.style.fontSize < '16px') {
                input.style.fontSize = '16px';
            }
        });
    }
}

// PWA installation prompt
function initializePWAPrompt() {
    let deferredPrompt;
    
    window.addEventListener('beforeinstallprompt', (e) => {
        e.preventDefault();
        deferredPrompt = e;
        
        // Show install button if it exists
        const installBtn = document.querySelector('#pwa-install-btn');
        if (installBtn) {
            installBtn.style.display = 'block';
            installBtn.addEventListener('click', () => {
                installBtn.style.display = 'none';
                deferredPrompt.prompt();
                deferredPrompt.userChoice.then((choiceResult) => {
                    if (choiceResult.outcome === 'accepted') {
                        console.log('User accepted the install prompt');
                    }
                    deferredPrompt = null;
                });
            });
        }
    });
}

// Initialize on DOM load
document.addEventListener('DOMContentLoaded', function() {
    initializeTooltips();
    initializeMobileSidebar();
    initializeTouchGestures();
    initializeResponsiveCharts();
    initializeMobileFormEnhancements();
    initializePWAPrompt();
    
    // Initialize mobile table cards after a short delay to ensure DOM is ready
    setTimeout(initializeMobileTableCards, 100);
    
    // Handle window resize
    window.addEventListener('resize', function() {
        // Close mobile sidebar if screen becomes large
        if (window.innerWidth >= 768) {
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.querySelector('.sidebar-overlay');
            if (sidebar) {
                sidebar.classList.remove('show');
                if (overlay) overlay.classList.remove('show');
                document.body.style.overflow = '';
            }
        }
    });
});
