<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EduErp.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Main">
    <body>
        <div class="container-fluid">
            <div class="row min-vh-100">
                <!-- Left Side - Hero Section -->
                <div class="col-lg-6 d-none d-lg-flex align-items-center justify-content-center bg-gradient-to-br from-blue-600 to-indigo-700 text-white">
                    <div class="text-center p-5">
                        <i class="fas fa-graduation-cap text-6xl mb-4"></i>
                        <h1 class="display-4 fw-bold mb-3">College ERP System</h1>
                        <p class="lead mb-4">
                            Streamline your educational institution with our comprehensive management solution
                        </p>
                        <div class="row text-center">
                            <div class="col-md-4">
                                <i class="fas fa-users text-3xl mb-2"></i>
                                <h5>Student Management</h5>
                            </div>
                            <div class="col-md-4">
                                <i class="fas fa-chalkboard-teacher text-3xl mb-2"></i>
                                <h5>Faculty Portal</h5>
                            </div>
                            <div class="col-md-4">
                                <i class="fas fa-cogs text-3xl mb-2"></i>
                                <h5>Admin Control</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side - Login Form -->
                <div class="col-lg-6 d-flex align-items-center justify-content-center p-5">
                    <div class="w-100" style="max-width: 400px;">
                        <div class="text-center mb-4">
                            <h2 class="h3 text-dark mb-2">Welcome Back</h2>
                            <p class="text-muted">
                                Sign in to access your dashboard
                            </p>
                        </div>

                        <!-- Login Form -->
                        <form id="loginForm">
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Enter your email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">
                                    Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <asp:TextBox ID="txtpass" runat="server" class="form-control" placeholder="Enter your password"></asp:TextBox>
                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="remember">
                                <label class="form-check-label" for="remember">
                                    Remember me</label>
                            </div>
                            <asp:LinkButton ID="BtnSubmit" runat="server" OnClick="BtnSubmit_click" class="btn btn-primary w-100 mb-3">
                                    <i class="fas fa-sign-in-alt"></i> Sign In
                            </asp:LinkButton>
                            <div class="text-center">
                                <a href="#" class="text-decoration-none">Forgot Password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>


