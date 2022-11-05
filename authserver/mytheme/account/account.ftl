<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("editAccountHtmlTitle")}</h2>
        </div>
        <div class="col-md-2 subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
    </div>
    <form action="${url.accountUrl}" class="form-horizontal" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="username" class="control-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                </div>
            </div>
        </#if>

        <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
            <div class="col-sm-2 col-md-2">
            <label for="email" class="control-label">${msg("email")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="email" name="email" autofocus value="${(account.email!'')}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="firstName" class="control-label">${msg("firstName")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
            </div>

        </div>

        <div class="form-group ${messagesPerField.printIfExists('middlename','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="user.attributes.middlename" class="control-label">${msg("middlename")}</label> <span class="required">*</span>
            </div>
            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="user.attributes.middlename" name="user.attributes.middlename" value="${(account.attributes.middlename!'')}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="lastName" class="control-label">${msg("lastName")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2 col-md-2">
                <label for="user.attributes.dob" class="control-label">${msg("dob")}</label>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="date" class="form-control" id="user.attributes.dob" name="user.attributes.dob" value="${(account.attributes.dob!'')}"/>
            </div>
        </div>


<div class="form-group">
    <div class="col-sm-2 col-md-2">
        <label for="user.attributes.address_line1" class="control-label">${msg("address_line1")}</label>
    </div>
    <div class="col-sm-10 col-md-10">
        <input type="text" class="form-control" id="user.attributes.address_line1" name="user.attributes.address_line1" value="${(account.attributes.address_line1!'')}"/>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-2 col-md-2">
        <label for="user.attributes.address_line2" class="control-label">${msg("address_line2")}</label>
    </div>
    <div class="col-sm-10 col-md-10">
        <input type="text" class="form-control" id="user.attributes.address_line2" name="user.attributes.address_line2" value="${(account.attributes.address_line2!'')}"/>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-2 col-md-2">
        <label for="user.attributes.zip" class="control-label">${msg("zip")}</label>
    </div>
    <div class="col-sm-10 col-md-10">
        <input type="text" class="form-control" id="user.attributes.zip" name="user.attributes.zip" value="${(account.attributes.zip!'')}"/>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-2 col-md-2">
        <label for="user.attributes.gender" class="control-label">${msg("gender")}</label>
    </div>

    <select class="${properties.kcInputClass!}" aria-label="unknow"
            id="user.attributes.gender"
            name="user.attributes.gender"
            value=" ${(account.attributes.gender!'')}"

    >
                <option value="male"
                       <#if account.attributes.gender == 'male'>
                             selected
                       </#if>
                >male</option>
        <option value="female"
        <#if account.attributes.gender == 'female'>
              selected
        </#if>
        >female</option>
    </select>
</div>

<div class="form-group">
    <div class="col-sm-2 col-md-2">
        <label for="user.attributes.about" class="control-label">${msg("about")}</label>
    </div>
    <div class="col-sm-10 col-md-10">
        <textarea class="form-control" id="user.attributes.about" name="user.attributes.about" >
            ${(account.attributes.about!'')}
        </textarea>
    </div>
</div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </div>
        </div>
    </form>

</@layout.mainLayout>
