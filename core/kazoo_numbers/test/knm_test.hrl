-ifndef(KNM_TEST_HRL).

-include_lib("eunit/include/eunit.hrl").

-define(MASTER_ACCOUNT_ID,   <<"account0000000000000000000000001">>).
-define(RESELLER_ACCOUNT_ID, <<"account0000000000000000000000002">>).
-define(CHILD_ACCOUNT_ID,    <<"account0000000000000000000000003">>).
-define(UNRELATED_ACCOUNT_ID, <<"unrelated_account_b113394f16cb71">>).

%% This is till needed by tests:
-define(RESELLER_ACCOUNT_DOC, kz_doc:set_id(kzd_accounts:new(), ?RESELLER_ACCOUNT_ID)).

-define(FEATURES_FOR_LOCAL_NUM, kz_json:from_list([{?FEATURE_LOCAL, kz_json:new()}])).
-define(START_BLOCK, <<"+14158867900">>).
-define(END_BLOCK, <<"+14158897909">>).

-define(BLOCK_PHONEBOOK_URL, <<"http://blocks.tld">>).
-define(NUMBER_PHONEBOOK_URL_L, "http://numbers.tld").
-define(NUMBER_PHONEBOOK_URL, <<?NUMBER_PHONEBOOK_URL_L>>).

-define(TEST_CREATE_NUM, <<"+15559871234">>).
-define(TEST_AVAILABLE_NUM, <<"+15551239876">>).
-define(TEST_IN_SERVICE_NUM, <<"+15551233322">>).
-define(TEST_IN_SERVICE_MDN, <<"+15551233324">>).
-define(TEST_IN_SERVICE_BAD_CARRIER_NUM, <<"+15551233337">>).
-define(TEST_IN_SERVICE_WITH_HISTORY_NUM, <<"+15551255693">>).
-define(TEST_RESERVED_NUM, <<"+14252151010">>).
-define(TEST_CREATE_TOLL, <<"+18887771111">>).
-define(TEST_EXISTING_TOLL, <<"+18005551212">>).
-define(TEST_OLD1_NUM, <<"+15045551226">>).
-define(TEST_OLD1_1_NUM, <<"+15045551227">>).
-define(TEST_OLD2_NUM, <<"+12014370855">>).
-define(TEST_OLD2_1_NUM, <<"+12014370856">>).
-define(TEST_OLD2_2_NUM, <<"+12014370857">>).
-define(TEST_OLD3_NUM, <<"+14082141750">>).
-define(TEST_OLD3_1_NUM, <<"+14082141751">>).
-define(TEST_OLD4_NUM, <<"+14242424247">>).
-define(TEST_OLD4_1_NUM, <<"+14242424248">>).
-define(TEST_OLD5_NUM, <<"+19377038880">>).
-define(TEST_OLD5_1_NUM, <<"+19377038881">>).
-define(TEST_OLD6_NUM, <<"+12156774700">>).
-define(TEST_OLD7_NUM, <<"+13977031887">>).
-define(TEST_OLD7_1_NUM, <<"+13977031888">>).
-define(TEST_TELNYX_NUM, <<"+14352154006">>).
-define(TEST_VITELITY_NUM, <<"+18122154006">>).
-define(TEST_PORT_IN_NUM, <<"+14252151007">>).
-define(TEST_PORT_IN2_NUM, <<"+14252151008">>).
-define(TEST_PORT_IN3_NUM, <<"+14252151009">>).
-define(TEST_NEW_PORT_NUM, <<"+19042471591">>).
-define(TEST_NEW_PORT_IN_NUM, <<"+19042471592">>).
-define(BW_EXISTING_DID, <<"+14122065197">>).
-define(TEST_AVAILABLE_NON_LOCAL_NUM, <<"+19162154006">>).

-define(TEST_NEW_PORT_REQ
       ,kz_json:expand(
          kz_json:from_list(
            [{kz_doc:path_id(), <<"bd99a9e8c6b16480449d78e1bca6817b">>}
            ,{kz_doc:path_revision(), <<"6-dead6acb1e87d94408461b6c8e9a99db">>}
            ,{[<<"carrier">>], <<"Unknown Carrier">>}
            ,{[<<"numbers">>]
             ,kz_json:from_list(
                [{?TEST_NEW_PORT_NUM, kz_json:from_list([{<<"used_by">>, <<"callflow">>}])}
                ])
             }
            ,{[<<"bill">>]
             ,kz_json:from_list(
                [{<<"name">>, <<"Karl Anderson">>}
                ,{<<"address">>, <<"140 Geary Street">>}
                ,{<<"locality">>, <<"San Francisco">>}
                ,{<<"region">>, <<"CA">>}
                ,{<<"postal_code">>, <<"94108">>}
                ])
             }
            ,{[<<"name">>], <<"Test Port">>}
            ,{[<<"notifications">>]
             ,kz_json:from_list(
                [{<<"email">>, kz_json:from_list([{<<"send_to">>, <<"lark@1300hz.com">>}])}
                ])
             }
            ,{[<<"transfer_date">>], 63655056000}
            ,{[<<"port_state">>], <<"unconfirmed">>}
            ,{[<<"ui_metadata">>]
             ,kz_json:from_list(
                [{<<"version">>, <<"4.0-20">>}
                ,{<<"ui">>,<<"monster-ui">>}
                ,{<<"origin">>,<<"common">>}
                ])
             }
            ,{[<<"pvt_port_state">>], <<"submitted">>}
            ,{kz_doc:path_type(), <<"port_request">>}
            ,{[<<"pvt_tree">>], [?MASTER_ACCOUNT_ID, <<"bbbbbd7435c9d8822406d27e72a1e91d">>]}
            ,{kz_doc:path_vsn(), <<"1">>}
            ,{kz_doc:path_account_id(), ?RESELLER_ACCOUNT_ID}
            ,{kz_doc:path_account_db(), <<"port_requests">>}
            ,{kz_doc:path_created(), 63654578539}
            ,{kz_doc:path_modified(), 63654578549}
            ,{[<<"pvt_request_id">>], <<"d19e1a27e72d6042288d9c5347d9e6d4">>}
            ,{[<<"pvt_auth_user_id">>], <<"aaaaad7435c9d8822406d27e72a1e91d">>}
            ,{[<<"pvt_auth_account_id">>], ?MASTER_ACCOUNT_ID}
            ,{[<<"pvt_is_authenticated">>], true}
            ,{[<<"_attachments">>]
             ,kz_json:from_list(
                [{<<"resporg.pdf">>
                 ,kz_json:from_list(
                    [{<<"content_type">>, <<"application/pdf">>}
                    ,{<<"revpos">>, 4}
                    ,{<<"digest">>, <<"md5-eEYd+NQg/SR6QXReENaxKQ==">>}
                    ,{<<"length">>, 81352}
                    ,{<<"stub">>, true}
                    ])
                 }
                ,{<<"loa.pdf">>
                 ,kz_json:from_list(
                    [{<<"content_type">>, <<"application/pdf">>}
                    ,{<<"revpos">>, 3}
                    ,{<<"digest">>, <<"md5-eEYd+NQg/SR6QXReENaxKQ==">>}
                    ,{<<"length">>, 81352}
                    ,{<<"stub">>, true}
                    ])
                 }
                ,{<<"bill.pdf">>
                 ,kz_json:from_list(
                    [{<<"content_type">>, <<"application/pdf">>}
                    ,{<<"revpos">>, 2}
                    ,{<<"digest">>, <<"md5-eEYd+NQg/SR6QXReENaxKQ==">>}
                    ,{<<"length">>, 81352}
                    ,{<<"stub">>, true}
                    ])
                 }])
             }])
         )).

-define(KNM_TEST_HRL, 'true').
-endif.
